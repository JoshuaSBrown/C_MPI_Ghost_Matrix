/******************************************************************************
 * Created: 27 March 2017                                                     *
 * Author:  Joshua S Brown                                                    *
 *                                                                            *
 * Purpose: This library was designed to enable easy manipulation of matrices *
 *          used in parallel programming. Many of the functions are           *
 *          containers for functions from a sister matrix.c file. However,    *
 *          the ghost_matrix libary makes use of ghost rows and columns around*
 *          a core. The ghost cols and rows are used to contain information   *
 *          about matrices held by neighboring rows. This is important in     *
 *          problems where there are interactions between the neighbring      *
 *          elements. Furthermore, MPI functionality on the ghost_matrices has*
 *          been implemented to make it easy to transfer information between  *
 *          neighboring processors.                                           *
 *                                                                            *
 * Conventions:                                                               *
 *  gmat -            Used to refer to the ghost_matrix                       *
 *  r -               Used to refer to the row                                *
 *  c -               Used to refer to the column                             *
 *  core_rows -       The number of rows in the core matrix                   *
 *  core_cols -       The number of cols in the core matrix                   *
 *  ghost_row_north - The number of rows extending above the core matrix      *
 *  ghost_row_south - The number of rows extending below the core matrix      *
 *  ghost_col_east -  The number of cols extending to the right of the core   *
 *                    matrix                                                  *
 *  ghost_col_west -  The number of cols extending to the left of the core    *
 *                    matrix                                                  *
 *  total_rows -      The total number of rows in the matrix takes into       *
 *                    account both the rows in the inner core matrix and the  *
 *                    ghost rows extending above and below the core matrix    *
 *  total_cols -      The total number of cols in the matrix takes into       *
 *                    account both the cols in the inner core matrix and the  *
 *                    ghost cols on either side of the core matrix            *
 *                                                                            *
 * File Organization is as follows:                                           *
 *  o Internal Library Functions                                              *
 *  o User Library Functions                                                  *
 *    - Creator                                                               *
 *    - Destructor                                                            *
 *    - Displayer                                                             *
 *    - Setters                                                               *
 *    - Getters                                                               *
 *    - Testers                                                               *
 *                                                                            *
 ******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "mpi_ghost_matrix.h"
#include "../../C_Matrix/C_MATRIX/matrix.h"

#ifdef _MPI_H_
#include "mpi.h"
#endif

/* In this data structure we have piggy backed off of the previously defined  *
 * matrix libary and thus we have a pointer to the matrix data structure. The *
 * matrix data structure contains the data and the total number of rows and   *
 * columns of the matrix. The other four members col_start, col_end, row_start*
 * and row_end indicate the positions where the ghost columns and rows begin  *
 * and end.                                                                   */
struct _ghost_matrix {
  matrix * mat;
  int col_start;
	int col_end;
	int row_start;
	int row_end;
};

/******************************************************************************
 * Internal Library Functions                                                 *
 ******************************************************************************/
static inline int _return_error_val(void){
  #ifdef _FORCE_HARD_CRASH
  exit(1);
  #endif
  return -1;
}

static inline int _getRowsCore(const ghost_matrix * gmat){
	return (gmat->row_end-gmat->row_start);
}

static inline int _getColsCore(const ghost_matrix * gmat){
	return (gmat->col_end-gmat->col_start);
}

static inline void _printFloat(void * val){
  float val2 = *(float *) val;
  printf("%6f\t",val2);
}

static inline void _printInt(void * val){
  float val2 = *(float *) val;
  printf("%3d\t",(int)val2);
}

/* Copies elements from one matrix to the other while manipulating the        *
 * elements as specified by the fun function pointer. The elements copied     *
 * between the two matrices are specified with the row_start col_start and    *
 * row_end and col_end arguments. The elements copied are inclusive of the end*
 * elements.                                                                  */
static inline void _manipulateElements(const int row_start           ,
                                       const int row_end             ,
                                       const int col_start           ,
                                       const int col_end             ,
                                       const ghost_matrix * gmat_orig,
                                       ghost_matrix * gmat_man       ,
                                       void * (*fun)(void *)       )
{

  for(int r=row_start;r<=row_end;r++){
    for(int c=col_start;c<=col_end;c++){
      float elem;
      getElemMatrix(gmat_orig->mat,r,c,&elem);
      float * elem2 = &elem;
      elem2 = (float *)fun((void *)elem2);
      setElemMatrix(gmat_man->mat,r,c,*elem2);
    }
  }

}

void * _Nothing(void * elem){
  return elem;
}
static inline void _printCycle(const int row_start      ,
                               const int row_end        ,
                               const int col_start      ,
                               const int col_end        ,
                               void (*fun)(void *)      ,
                               const ghost_matrix * gmat)
{
  for(int r=row_start;r<row_end;r++){
		printf("Row %d\t",r+1);
		for(int c=col_start;c<col_end;c++){
      float elem;
      getElemMatrix(gmat->mat,r,c,&elem);
      float * elem2 = &elem;
      fun((void *)elem2);
		}
		printf("\n");
	}
	printf("\n");
}

static inline ghost_matrix * _newGM(const int core_rows	     ,
                                    const int core_cols      ,
							                      const int ghost_row_north,
                                    const int ghost_row_south,
                                    const int ghost_col_east ,
                                    const int ghost_col_west )
{

  // Step 1 Calculate full dimensions of the matrix
  const int total_rows = core_rows + ghost_row_north + ghost_row_south;
  const int total_cols = core_cols + ghost_col_east  + ghost_col_west ;

  // Step 2 Allocate memory for the ghost_matrix container data structure
  ghost_matrix * gmat = (ghost_matrix *) malloc(sizeof(struct _ghost_matrix));

  #ifdef _ERROR_CHECKING_ON_
  if(gmat==NULL){
    fprintf(stderr,"ERROR gmat is NULL in _newGM\n");
    _return_error_val();
    return NULL;
  }
  #endif

  // Step 3 Allocate memory for the actual matrix
  gmat->mat = newMatrix(total_rows,total_cols);

  #ifdef _ERROR_CHECKING_ON_
  if(gmat->mat==NULL){
    fprintf(stderr,"ERROR gmat->mat is NULL in _newGM\n");
    free(gmat);
    _return_error_val();
    return NULL;
  }
  #endif

  // Step 4 Initialize ghost_matrix attributes
  gmat->row_start = ghost_row_north;
  gmat->row_end   = core_rows+ghost_row_north;
  gmat->col_start = ghost_col_west;
  gmat->col_end   = core_cols+ghost_col_west;

  return gmat;
}

/******************************************************************************
 * User Library Functions                                                     *
 ******************************************************************************/
/* Creator                                                                    */
/* Creates a 2d matrix from scratch                                           */
ghost_matrix * newGhostMatrix(const int core_rows, const int core_cols){

	#ifdef _ERROR_CHECKING_ON_
	if(core_rows<1){
		fprintf(stderr,"ERROR rows is less than 1 in new_matrix\n");
		_return_error_val();
		return NULL;
	}
	if(core_cols<1){
		fprintf(stderr,"ERROR cols is less than 1 in new_matrix\n");
		_return_error_val();
		return NULL;
	}
	#endif

  // Step1 Create the ghost_matrix data structure
  ghost_matrix * gmat = _newGM(core_rows,core_cols,0,0,0,0);
	return gmat;
}

/* Creates a 2d matrix from scratch, with ghost extensions the extenions can  *
 * extend above and below the matrix defined by core_rows and core_cols.      */
ghost_matrix * newGhostMatrixRowPanel(const int core_rows	     ,
                                      const int core_cols      ,
							                        const int ghost_row_north,
                                      const int ghost_row_south)
{

	#ifdef _ERROR_CHECKING_ON_
	if(core_rows<1){
		fprintf(stderr,"ERROR core_rows is less than 1 in "
                   "newGhostMatrixRowPanel\n");
		_return_error_val();
		return NULL;
	}
	if(core_cols<1){
		fprintf(stderr,"ERROR core_cols is less than 1 in "
                   "newGhostMatrixRowPanel\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_row_north<0){
		fprintf(stderr,"ERROR ghost_row_above is less than 0 in "
                   "newGhostMatrixRowPanel\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_row_south<0){
		fprintf(stderr,"ERROR ghost_row_below is less than 0 in "
                   "new_matrix_row_panel\n");
		_return_error_val();
		return NULL;
	}
	#endif

  ghost_matrix * gmat = _newGM(core_rows      ,
                               core_cols      ,
                               ghost_row_north,
                               ghost_row_south,
                               0              ,
                               0              );
	return gmat;
}

/* Creates a 2d matrix from scratch, with ghost extensions, the extenions can *
 * extend above and below the matrix defined by core_rows and core_cols, they *
 * can also extend to the left and the right.                                 */
ghost_matrix * newGhostMatrixCheckerboard(const int core_rows	     ,
                                          const int core_cols      ,
							                            const int ghost_row_north,
                                          const int ghost_row_south,
                                          const int ghost_col_east ,
                                          const int ghost_col_west )
{
	#ifdef _ERROR_CHECKING_ON_
	if(core_rows<1){
		fprintf(stderr,"ERROR core_rows is less than 1 in "
                   "newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	if(core_cols<1){
		fprintf(stderr,"ERROR core_cols is less than 1 in "
                   "newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_row_north<0){
		fprintf(stderr,"error ghost_row_above is less than 0 "
                   "in newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_row_south<0){
		fprintf(stderr,"error ghost_row_below is less than 0 "
                   "in newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_col_east<0){
		fprintf(stderr,"error ghost_col_right is less than 0 "
                   "in newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	if(ghost_col_west<0){
		fprintf(stderr,"error ghost_col_left is less than 0 in"
                   " newGhostMatrixCheckerboard\n");
		_return_error_val();
		return NULL;
	}
	#endif

  ghost_matrix * gmat = _newGM(core_rows      ,
                               core_cols      ,
  							               ghost_row_north,
                               ghost_row_south,
                               ghost_col_east ,
                               ghost_col_west );

	return gmat;
}

/* Destructor                                                                 */
/* Removes the ghost_matrix from the heap                                     */
int deleteGhostMatrix(ghost_matrix ** gmat){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in deleteGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  // Step 1 Free the matrix held in the ghost_matrix
  free((*gmat)->mat);
  // Step 2 Free the ghost_matrix data structure
  free(*gmat);
  // Step 3 Set the ghost_matrix pointer to NULL
	*gmat = NULL;
	return 0;
}

/* Displayers                                                                 */
/* Designed to print the contents of the ghost_matrix in floating point digits*/
int printGhostMatrix(const ghost_matrix * gmat){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in printGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  // Step 1 Determine the total rows and cols of the matrix
  int total_rows = getRowsMatrix(gmat->mat);
  int total_cols = getColsMatrix(gmat->mat);

	printf("\n*****************************************\n");
	printf("Total cols %d Total rows %d\n\n",total_cols,total_rows);
	printf("col_start %d col_end %d\n",gmat->col_start,gmat->col_end);
	printf("row_start %d row_end %d\n",gmat->row_start,gmat->row_end);

  // Step 2 Print the top ghost rows
	if(gmat->row_start>0){
		printf("Ghost Rows %d\n",gmat->row_start);
		for(int c=0;c<total_cols;c++){
			printf("\tCol %d\t",c+1);
		}

		printf("\n");
    _printCycle(0              ,
                gmat->row_start,
                0              ,
                total_cols     ,
                &_printFloat   ,
                gmat           );

	}

	printf("Core Matrix Rows %d\n",gmat->row_end-gmat->row_start);
  for(int c=0;c<total_cols;c++){
		if(c<gmat->col_start){
			printf("\t Ghost Col %d",c+1);
		}else if(c>=gmat->col_end){
			printf("\t Ghost Col %d",c+1);
		}else{
			printf("\t Col %d\t",c+1);
		}
	}

  // Step 3 Print the core ghost rows
	printf("\n");
  _printCycle(gmat->row_start,
              gmat->row_end  ,
              0              ,
              total_cols      ,
              &_printFloat   ,
              gmat           );

	if(gmat->row_end!=total_rows){
		printf("Ghost Rows %d\n",(total_rows-gmat->row_end));
		for(int c=0;c<total_cols;c++){
			printf("\t Col %d\t",c+1);
		}
		printf("\n");

    // Step 4 Print the bottom ghost rows
    _printCycle(gmat->row_end,
                total_rows   ,
                0            ,
                total_cols   ,
                &_printFloat ,
                gmat         );
	}

	return 0;
}

/* Prints the contents of the matrix in a more concise format by reformatting *
 * the floating point numbers as intergers. This function is only meant to be *
 * used with floating point numbers between 0 and 999                         */
int printCompGhostMatrix(const ghost_matrix * gmat){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in printCompGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  // Step 1 Grab the total number of rows and columns in the matrix
  int total_rows = getRowsMatrix(gmat->mat);
  int total_cols = getColsMatrix(gmat->mat);

	printf("\n*****************************************\n");
	printf("Total cols %d Total rows %d\n\n",total_cols,total_rows);
	printf("col_start %d col_end %d\n",gmat->col_start,gmat->col_end);
	printf("row_start %d row_end %d\n",gmat->row_start,gmat->row_end);

  // Step 2 Print the top ghost rows
	if(gmat->row_start>0){
     _printCycle(0              ,
                 gmat->row_start,
                 0              ,
                 total_cols     ,
                 &_printInt     ,
                 gmat           );
	}

  // Step 3 Print the core ghost rows
  _printCycle(gmat->row_start,
              gmat->row_end  ,
              0              ,
              total_cols     ,
              &_printInt     ,
              gmat           );

  // Step 4 Print the bottom ghost rows
	if(gmat->row_end!=total_rows){
    _printCycle(gmat->row_end,
                total_rows   ,
                0            ,
                total_cols   ,
                &_printInt   ,
                gmat         );
	}

	return 0;
}

/* Setters                                                                    */

int setElemGhostMatrix(ghost_matrix * gmat,
                       const int r        ,
                       const int c        ,
                       const float val    )
{

  #ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in setElemGhostMatrix\n");
		return _return_error_val();
	}
  #endif

  int rows = getRowsMatrix(gmat->mat);
  int cols = getColsMatrix(gmat->mat);

  #ifdef _ERROR_CHECKING_ON_
	if(r<0){
		fprintf(stderr,"ERROR r is less than 0 in setElemGhostMatrix\n");
		return _return_error_val();
	}
	if(c<0){
		fprintf(stderr,"ERROR c is less than 0 in setElemGhostMatrix\n");
		return  _return_error_val();
	}
	if(r>=rows){
		fprintf(stderr,"ERROR r greater than rows in matrix setElemGhostMatrix\n");
		return  _return_error_val();
	}
	if(c>=cols){
		fprintf(stderr,"ERROR c greater than cols in matrix setElemGhostMatrix\n");
		return  _return_error_val();
	}
	#endif
	return setElemMatrix(gmat->mat,r,c,val);
}

int setAllGhostMatrix(ghost_matrix * gmat, const float val){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in setAllGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  return setAllMatrix(gmat->mat, val);
}

int setElemCoreGhostMatrix(ghost_matrix * gmat,
                           const int r        ,
                           const int c        ,
                           const float val    )
{

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in setElemCoreGhostMatrix\n");
		return _return_error_val();
	}
	if(r<0){
		fprintf(stderr,"ERROR r is less than 0 in "
                       "setElemCoreGhostMatrix\n");
		return _return_error_val();
	}
	if(c<0){
		fprintf(stderr,"ERROR c is less than 0 in "
                       "setElemCoreGhostMatrix\n");
		return _return_error_val();
	}
	if(r>=(gmat->row_end-gmat->row_start)){
		fprintf(stderr,"ERROR r greater than rows in core matrix "
                       "setElemCoreGhostMatrix\n");
		return _return_error_val();
	}
	if(c>=(gmat->col_end-gmat->col_start)){
		fprintf(stderr,"ERROR c greater than cols in matrix "
                       "setElemCoreGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  setElemMatrix(gmat->mat,r+gmat->row_start,c+gmat->col_start,val);
	return 0;
}

/* Getters                                                                    */
int getRowStartGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getRowStartGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return gmat->row_start;
}

int getRowEndGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getRowEndGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return gmat->row_end;
}

int getColStartGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in getColStartGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return gmat->col_start;
}

int getColEndGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in getColEndGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return gmat->col_end;
}

int getRowsGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getRowsStartGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return getRowsMatrix(gmat->mat);
}

int getColsGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getColsGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return getColsMatrix(gmat->mat);
}

int getTotalGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getTotalGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return getTotalElemsMatrix(gmat->mat);
}

int getRowsCoreGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getRowsCoreGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return _getRowsCore(gmat);
}

int getColsCoreGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getColsCoreGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return _getColsCore(gmat);
}

int getTotalCoreGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getTotalCoreGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return _getRowsCore(gmat)*_getColsCore(gmat);
}

int getColsWestGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getColsWestGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return (gmat->col_start);
}

int getColsEastGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getColsEastGhostMatrix\n");
		return _return_error_val();
	}
	#endif

	return (getColsMatrix(gmat->mat)-gmat->col_end);
}

int getRowsNorthGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in getRowsNorthGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return (gmat->row_start);
}

int getRowsSouthGhostMatrix(const ghost_matrix * gmat){
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getRowsSouthGhostMatrix\n");
		return _return_error_val();
	}
	#endif
	return (getRowsMatrix(gmat->mat)-gmat->row_end);
}

float getElemGhostMatrix(const ghost_matrix * gmat,const int r,const int c){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in getElemGhostMatrix\n");
		return (float)_return_error_val();
	}
  #endif

  int rows = getRowsMatrix(gmat->mat);
  int cols = getColsMatrix(gmat->mat);

  #ifdef _ERROR_CHECKING_ON_
	if(r<0){
		fprintf(stderr,"ERROR row is less than 0 in getElemGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(c<0){
		fprintf(stderr,"ERROR col is less than 0 in getElemGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(r>=rows){
		fprintf(stderr,"ERROR row greater than rows in matrix "
                   "getElemGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(c>=cols){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                   "getElemGhostMatrix\n");
		return (float)_return_error_val();
	}
	#endif

  float elem;
  getElemMatrix(gmat->mat,r,c,&elem);
	return elem;
}


/* start_row, end_row, start_col and end_col can be any
 * value between and including 0 and row-1, col-1 of the
 * smallest of the two matrices */
int copyGhostMatrix(const int start_row_elem      ,
                    const int end_row_elem        ,
                    const int start_col_elem      ,
                    const int end_col_elem        ,
                    const ghost_matrix * gmat_orig,
                    ghost_matrix * gmat_copy      )
{

  /* Add 1 because the elements at 0 are included */
  int col_length = end_col_elem-start_col_elem+1;
  int row_length = end_row_elem-start_row_elem+1;
  #ifdef _ERROR_CHECKING_ON_
  if(gmat_copy == NULL){
      fprintf(stderr,"ERROR gmat_copy is NULL in copyGhostMatrix\n");
      return _return_error_val();
  }
  if(gmat_orig == NULL){
      fprintf(stderr,"ERROR gmat_orig is NULL in copyGhostMatrix\n");
      return _return_error_val();
  }
  #endif

  int orig_rows = getRowsMatrix(gmat_orig->mat);
  int orig_cols = getColsMatrix(gmat_orig->mat);

  int copy_rows = getRowsMatrix(gmat_copy->mat);
  int copy_cols = getColsMatrix(gmat_copy->mat);

  #ifdef _ERROR_CHECKING_ON_
	if(start_row_elem>end_row_elem){
		fprintf(stderr,"ERROR start_row_elem is larger than end_row in "
                   "copyGhostMatrix\n");
		return _return_error_val();
	}
	if(start_col_elem>end_col_elem){
		fprintf(stderr,"ERROR start_col_elem larger than end_col in"
                   "copyGhostMatrix\n");
		return _return_error_val();
	}
	if(start_row_elem<0){
		fprintf(stderr,"ERROR start_row_elem is less than 0 in copyGhostMatrix\n");
		return _return_error_val();
	}
	if(end_row_elem>=orig_rows){
		fprintf(stderr,"ERROR end_row_elem  extends past the row length of the "
                   "original matrix in copyGhostMatrix\n");
		return _return_error_val();
	}
	if(row_length>copy_rows){
		fprintf(stderr,"ERROR rows to be copied extend past the row length of "
                   "gmat_copy in copyGhostMatrix\n");
		return _return_error_val();
	}
	if(start_col_elem<0){
		fprintf(stderr,"ERROR start_col_elem  is less than 0 in copyGhostMatrix\n");
		return _return_error_val();
	}
	if(end_col_elem>=orig_cols){
		fprintf(stderr,"ERROR end_col_elem  is larger than the column length of the"
                   " original matrix in copyGhostMatrix\n");
		return _return_error_val();
	}
	if(col_length>copy_cols){
		fprintf(stderr,"ERROR columns extend past the column length of mat_copy in "
                   "copyGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  _manipulateElements(start_row_elem,
                      end_row_elem  ,
                      start_col_elem,
                      end_col_elem  ,
                      gmat_orig     ,
                      gmat_copy     ,
                      &_Nothing     );

	return 0;
}

float getElemCoreGhostMatrix(const ghost_matrix * gmat,
                             const int row            ,
                             const int col            )
{
	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in getElemCoreGhostMatrix\n");
		return (float) _return_error_val();
	}
	if(row<0){
		fprintf(stderr,"ERROR row is less than 0 in "
                       "getElemCoreGhostMatrix\n");
		return (float) _return_error_val();
	}
	if(col<0){
		fprintf(stderr,"ERROR col is less than 0 in "
                       "getElemCoreGhostMatrix\n");
		return (float) _return_error_val();
	}
	if(row>=(gmat->row_end-gmat->row_start)){
		fprintf(stderr,"ERROR row greater than rows in core matrix "
                       "getElemCoreGhostMatrix\n");
		return (float) _return_error_val();
	}
	if(col>=(gmat->col_end-gmat->col_start)){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                       "getElemCoreGhostMatrix\n");
		return (float) _return_error_val();
	}
	#endif
  float val;
	getElemMatrix(gmat->mat,row+gmat->row_start,col+gmat->col_start,&val);
  return val;
}

float sumAllCoreMatrix(const ghost_matrix * gmat){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in sumAllCoreMatrix\n");
		return (float)_return_error_val();
	}
	#endif

	int i;
	int j;
	float sum;
	sum = 0;
  printf("row_start %d, row_end %d, col_start %d col_end %d\n",gmat->row_start, gmat->row_end,gmat->col_start,gmat->col_end);
  sumElemsMatrix(gmat->row_start,
                 gmat->row_end-1,
                 gmat->col_start,
                 gmat->col_end-1,
                 gmat->mat      ,
                 &sum           );
	return sum;
}

int setElemNorthGhostMatrix(ghost_matrix * gmat,
                            const int row      ,
                            const int col      ,
                            float val          ){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR gmat is NULL in setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	if(row<0){
		fprintf(stderr,"ERROR row is less than 0 in setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	if(col<0){
		fprintf(stderr,"ERROR col is less than 0 in setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	if(gmat->row_start==0){
		fprintf(stderr,"ERROR mat does not have a top ghost row in "
                       "setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	if(row>=gmat->row_start){
		fprintf(stderr,"ERROR row is larger than the rows in the top  ghost matrix "
                   "in setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	if(col>=getColsMatrix(gmat->mat)){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                       "setElemNorthGhostMatrix\n");
		return _return_error_val();
	}
	#endif

  setElemMatrix(gmat->mat,row,col,val);

	return 0;
}

float getElemNorthGhostMatrix(const ghost_matrix * gmat,
                              const int row            ,
                              const int col            ){

  #ifdef _ERROR_CHECKING_ON_
    if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in "
                       "getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(row<0){
		fprintf(stderr,"ERROR row is less than 0 in "
                       "getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(col<0){
		fprintf(stderr,"ERROR col is less than 0 in "
                       "getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(gmat->row_start==0){
		fprintf(stderr,"ERROR mat does not have a top ghost row in "
                       "getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(row>=gmat->row_start){
		fprintf(stderr,"ERROR row is larger than the rows in the top"
                       " ghost matrix in getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	if(col>=getColsMatrix(gmat->mat)){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                       "getElemNorthGhostMatrix\n");
		return (float)_return_error_val();
	}
	#endif

  float val;
  getElemMatrix(gmat->mat,row,col,&val);
	return val;
}

int setElemSouthGhostMatrix(ghost_matrix * gmat,
                            const int row,
                            const int col, float val){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in "
                       "setElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(row<0){
		fprintf(stderr,"ERROR row is less than 0 in "
                       "setElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(col<0){
		fprintf(stderr,"ERROR col is less than 0 in "
                       "setElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if((getRowsMatrix(gmat->mat)-gmat->row_end)==0){
		fprintf(stderr,"ERROR mat does not have a top ghost row in "
                       "setElemSouthGhostMatrix\n");
	return _return_error_val();
	}
	if(row>=(getRowsMatrix(gmat->mat)-gmat->row_end)){
		fprintf(stderr,"ERROR row is larger than the size of the "
                       "bottom ghost matrix in "
                       "setElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(col>=getColsMatrix(gmat->mat)){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                       "setElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	#endif
  setElemMatrix(gmat->mat,row+gmat->row_end,col,val);
	return 0;
}

float getElemSouthGhostMatrix(const ghost_matrix * gmat,
                              const int row,
                              const int col){

	#ifdef _ERROR_CHECKING_ON_
	if(gmat==NULL){
		fprintf(stderr,"ERROR mat is NULL in "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(row<0){
		fprintf(stderr,"ERROR row is less than 0 in "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(col<0){
		fprintf(stderr,"ERROR col is less than 0 in "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if((getRowsMatrix(gmat->mat)-gmat->row_end)==0){
		fprintf(stderr,"ERROR mat does not have a top ghost row in "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(row>=(getRowsMatrix(gmat->mat)-gmat->row_end)){
		fprintf(stderr,"ERROR row is larger than the size of the "
                       "bottom ghost matrix in "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	if(col>=getColsMatrix(gmat->mat)){
		fprintf(stderr,"ERROR col greater than cols in matrix "
                       "getElemSouthGhostMatrix\n");
		return _return_error_val();
	}
	#endif
  float val;
  getElemMatrix(gmat->mat,row+gmat->row_end,col,&val);
	return val;
}
//
//int send_matrix(matrix mat){
//
//	#ifdef _MPI_H_
//	MPI_Datatype Matrix_type;
//	MPI_Aint start_address;
//	MPI_Aint address;
//
//	MPI_Datatype type[7];
//	type[0] = MPI_INT;
//	type[1] = MPI_INT;
//	type[2] = MPI_INT;
//	type[3] = MPI_INT;
//	type[4] = MPI_INT;
//	type[5] = MPI_INT;
//	type[6] = MPI_FLOAT;
//
//	MPI_Aint displacements[7];
//	displacements[0] = 0;
//
//	MPI_Get_address(&(mat->rows),&start_address);
//	MPI_Get_address(&(mat->cols),&address);
//	displacements[1] = address-start_address;
//	MPI_Get_address(&(mat->col_start),&address);
//	displacements[2] = address-start_address;
//	MPI_Get_address(&(mat->col_end),&address);
//	displacements[3] = address-start_address;
//	MPI_Get_address(&(mat->row_start),&address);
//	displacements[4] = address-start_address;
//	MPI_Get_address(&(mat->row_end),&address);
//	displacements[5] = address-start_address;
//	MPI_Get_address(&(mat->data),&address);
//	displacements[6] = address-start_address;
//
//	int blocklen[7];
//	blocklen[0] = 1;
//	blocklen[1] = 1;
//	blocklen[2] = 1;
//	blocklen[3] = 1;
//	blocklen[4] = 1;
//	blocklen[5] = 1;
//	blocklen[6] = get_total_elems(mat);
//
//	MPI_Type_create_struct(7, blocklen, displacements,type, &Matrix_type );
//	MPI_Type_commit(&Matrix_type);
//
//	MPI_Send(&(mat->rows),1, Matrix_type,dest,0,MPI_COMM_WORLD);
//
//	MPI_Type_free(&Matrix_type);
//	#endif
//	return 0;
//}
//
//int receive_matrix(matrix mat){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(mat==NULL){
//		fprintf(stderr,"ERROR receiving matrix to location that "
//                       "is NULL. It would be advisable to create"
//                       " a matrix in memory first, MPI can then "
//                       "write to the location when it recieves "
//                       "data structure..");
//		return _return_error_val();
//	}
//	#endif
//
//	#ifdef _MPI_H_
//	MPI_Datatype Matrix_type;
//	MPI_Aint start_address;
//	MPI_Aint address;
//
//	MPI_Datatype type[7];
//	type[0] = MPI_INT;
//	type[1] = MPI_INT;
//	type[2] = MPI_INT;
//	type[3] = MPI_INT;
//	type[4] = MPI_INT;
//	type[5] = MPI_INT;
//	type[6] = MPI_FLOAT;
//
//	MPI_Aint displacements[7];
//	displacements[0] = 0;
//
//	MPI_Get_address(&(mat->rows),&start_address);
//	MPI_Get_address(&(mat->cols),&address);
//	displacements[1] = address-start_address;
//	MPI_Get_address(&(mat->col_start),&address);
//	displacements[2] = address-start_address;
//	MPI_Get_address(&(mat->col_end),&address);
//	displacements[3] = address-start_address;
//	MPI_Get_address(&(mat->row_start),&address);
//	displacements[4] = address-start_address;
//	MPI_Get_address(&(mat->row_end),&address);
//	displacements[5] = address-start_address;
//	MPI_Get_address(&(mat->data),&address);
//	displacements[6] = address-start_address;
//
//	int blocklen[7];
//	blocklen[0] = 1;
//	blocklen[1] = 1;
//	blocklen[2] = 1;
//	blocklen[3] = 1;
//	blocklen[4] = 1;
//	blocklen[5] = 1;
//	blocklen[6] = get_total_elems(mat);
//
//	MPI_Type_create_struct(7, blocklen, displacements,type, &Matrix_type );
//	MPI_Type_commit(&Matrix_type);
//
//	MPI_Recv(&(mat->rows),1, Matrix_type,source,0,MPI_COMM_WORLD,&status);
//
//	MPI_Type_free(&Matrix_type);
//	#endif
//	return 0;
//}
//
//
///* Will send the col from the core matrix and receive
// * the col to the ghost col, if running checker this
// * function should be called before the send and receive
// * ghost row function */
//bool send_recv_ghost_cols(matrix * new_mat){
//
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(new_mat==NULL){
//		fprintf(stderr,"ERROR new_mat is NULL in send_recv_ghost_cols\n");
//		_return_error_val();
//		return false;
//	}
//	#endif
//	int tag = 2;
//	float * val_ghost;
//	float * val_core;
//	int col;
//	int row;
//	int count;
//	int blocklength;
//	int stride;
//	#ifdef _MPI_H_
//	MPI_Datatype Column_type;
//	#endif
//	/* Will send each column, one at a time. First will
//     * send in the direction indicated in the following
//     * diagram:
//     *
//     *         Rank 0 --> Rank 1 --> Rank 2
//     *         Rank 3 --> Rank 4 --> Rank 5
//     *         Rank 6 --> Rank 7 --> Rank 8
//     *
//     */
//
//	if(verbose){
//		printf("Matrix to send and receive columns\n");
//		print_matrix_compressed(*new_mat);
//	}
//
//	dest   = grid_index(my_grid_row,(my_grid_col+1+grid_dim_col)%(grid_dim_col));
//	source =  grid_index(my_grid_row,(my_grid_col-1+grid_dim_col)%(grid_dim_col));
//
//	int ghost_cols = 0;
//	int ghost_cols_left = 0;
//	int ghost_cols_right = 0;
//
//	if((*new_mat)->col_start>0){
//		ghost_cols_left = (*new_mat)->col_start;
//	}
//	if(((*new_mat)->cols-(*new_mat)->col_end)>0){
//		ghost_cols_right = (*new_mat)->cols-(*new_mat)->col_end;
//	}
//
//	if(ghost_cols_left>ghost_cols_right){
//		ghost_cols = ghost_cols_left;
//	}else{
//		ghost_cols = ghost_cols_right;
//	}
//
//	/* We must create a derived data type to deal with the columns
//	 * count       - for a column is the number of elements in a
//	 *               column this is equivalent to the number of rows.
//	 * blocklength - Are only taking a single element at each row in
//	 *               in the column thus block length will be 1
//	 * stride      - The stride is equivalent to the number of rows
//	 *               in the original matrix not the core matrix */
//	count       = get_rows_core_matrix(*new_mat);
//	blocklength = ghost_cols;
//	stride      = get_cols(*new_mat);
//
//	if(verbose){
//		printf("Vector type:\n");
//		printf("count %d\n",count);
//		printf("blocklength %d\n",blocklength);
//		printf("stride %d\n",stride);
//		printf("Rows %d Cols %d in matrix\n",
//				get_rows(*new_mat),get_cols(*new_mat));
//	}
//	#ifdef _MPI_H_
//	MPI_Type_vector(count,blocklength,
//					stride,MPI_FLOAT,
//					&Column_type);
//
//	MPI_Type_commit(&Column_type);
//	#endif
//
//	if(my_grid_col==0){
//		/* Grab the float located at the last column of
//		 * the core new_matrix. We will grab the columns at the
//		 * right of the core new_matrix because they are
//		 * what we will be sending */
//		col = (*new_mat)->col_end-ghost_cols;
//		row = (*new_mat)->row_start;
//		if(verbose){
//			printf("Rank %d sending columns starting at ELEM(new_mat,%d,%d)=%f"
//					" sending to %d\nNote if row is not 0 it just means "
//					"that there are ghost rows. When sending the columns"
//					" we are excluding the ghost rows thus there may be "
//					"an offset which would explain why rows may not be 0"
//					"\n",my_rank,row,col,ELEM(*new_mat,row,col),dest);
//		}
//
//		val_core = &(ELEM(*new_mat,row,col));
//
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, 1, Column_type, dest, tag,
//					MPI_COMM_WORLD);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, 1, Column_type, dest, tag,
//					MPI_COMM_WORLD,&send_request3);
//			#endif
//		}
//	}else if(my_grid_col==(grid_dim_col-1)){
//		/* Grab the float located at the first row
//		 * (in the core matrix) in the left ghost col.
//		 * This is where we will be receiving from */
//		col = 0;
//		row = (*new_mat)->row_start;
//		if(verbose){
//			printf("Rank %d receiving value at ELEM(new_mat,%d,%d)=%f from %d\n"
//					"Note rows may not be NULL especially if there are ghost"
//					" rows above and below the core matrix. When we send the"
//					" columns we are excluding the elements that exist in the"
//					" ghost rows.",my_rank,row,col,ELEM(*new_mat,row,col),source);
//		}
//		val_ghost=&(ELEM((*new_mat),row,col));
//
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Recv(val_ghost, 1, Column_type, source, tag,
//					 MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Irecv(val_ghost, 1, Column_type, source, tag,
//					  MPI_COMM_WORLD, &recv_request3);
//			#endif
//		}
//
//	}else{
//		/* Grab the float located at the last column of
//		 * the core new_matrix. We will grab the columns at the
//		 * right of the core new_matrix because they are
//		 * what we will be sending */
//		col = (*new_mat)->col_end-ghost_cols;
//		row = (*new_mat)->row_start;
//		val_core = &(ELEM((*new_mat),row,col));
//		/* Grab the float located at the first row
//		 * (in the core matrix) in the left ghost col.
//		 * This is where we will be receiving from */
//		col = 0;
//		row = (*new_mat)->row_start;
//		val_ghost=&(ELEM((*new_mat),row,col));
//
//		if(verbose){
//			printf("Rank %d Sending to %d and Receiving from %d\n",
//					my_rank, dest, source);
//		}
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, 1, Column_type, dest, tag,
//					 MPI_COMM_WORLD);
//			MPI_Recv(val_ghost, 1, Column_type, source, tag,
//					 MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, 1, Column_type, dest, tag,
//					  MPI_COMM_WORLD, &send_request3);
//			MPI_Irecv(val_ghost, 1, Column_type, source, tag,
//					  MPI_COMM_WORLD, &recv_request3);
//			#endif
//		}
//
//	}
//
//	/* Will send each col, one at a time. Will now
//	 * send in the direction indicated in the following
//	 * diagram:
//	 *         Rank 0 <-- Rank 1 <-- Rank 2
//	 *         Rank 3 <-- Rank 4 <-- Rank 5
//	 *         Rank 6 <-- Rank 7 <-- Rank 8
//	 *
//	 */
//
//	/* Switch the source and destination processors
//	 * will now be receiving from */
//	dest   = grid_index(my_grid_row,(my_grid_col-1+grid_dim_col)%(grid_dim_col));
//	source =  grid_index(my_grid_row,(my_grid_col+1+grid_dim_col)%(grid_dim_col));
//
//	/* Increment until we have sent all of the ghost_rows
//	 * located on the top of the core new_matrix */
//	tag = 3;
//
//	/* Sending left column and receiving to right column */
//	if(my_grid_col==0){
//		/* Grab the float located at the last column in
//		 * the ghost columns and within the core matrix row.
//		 * This is where we will be receiving from.*/
//		row = (*new_mat)->row_start;
//		col = (*new_mat)->col_end;
//		if(verbose){
//			printf("Rank %d receiving value at ELEM(new_mat,%d,%d)=%f from %d\n",my_rank,row,col,get_elem(*new_mat,row,col),source);
//		}
//
//		val_ghost= &(ELEM((*new_mat),row,col));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Recv(val_ghost, 1, Column_type, source, tag,
//					 MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Irecv(val_ghost, 1, Column_type, source, tag,
//					  MPI_COMM_WORLD, &recv_request4);
//			#endif
//		}
//	}else if(my_grid_col==(grid_dim_col-1)){
//		/* Grab the float located at the first row of
//		 * the core new_matrix and the first column of the core_
//		 * matrix. We will grab the cols at the left
//		 * of the core new_matrix because these are what we will be
//		 * sending to the right of the destinations processors ghost
//		 * col */
//		row = (*new_mat)->row_start;
//		col = (*new_mat)->col_start;
//		if(verbose){
//			printf("Rank %d sending value at ELEM(new_mat,%d,%d)=%f to %d\n",my_rank,row,col,get_elem(*new_mat,row,col),dest);
//		}
//
//		val_core=&(ELEM((*new_mat),row,col));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, 1, Column_type, dest, tag,
//					 MPI_COMM_WORLD);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, 1, Column_type, dest, tag,
//					  MPI_COMM_WORLD, &send_request4);
//			#endif
//		}
//	}else{
//		/* Grab the float located at the first row of
//		 * the core new_matrix and the first column of the core_
//		 * matrix. We will grab the cols at the left
//		 * of the core new_matrix because these are what we will be
//		 * sending to the right of the destinations processors ghost
//		 * col */
//		row = (*new_mat)->row_start;
//		col = (*new_mat)->col_start;
//		val_core=&(ELEM((*new_mat),row,col));
//		/* Grab the float located at the last column in
//		 * the ghost columns and within the core matrix row.
//		 * This is where we will be receiving from.*/
//		row = (*new_mat)->row_start;
//		col = (*new_mat)->col_end;
//		val_ghost=&(ELEM((*new_mat),row,col));
//		/* Notice that rank 0 does not participate because
//		 * it does not have a top ghost row and our World is
//		 * not periodic. */
//		if(verbose){
//			printf("Rank %d Sending to %d and Receiving from %d\n",
//					my_rank, dest, source);
//		}
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, 1, Column_type, dest, tag,
//					 MPI_COMM_WORLD);
//			MPI_Recv(val_ghost, 1, Column_type, source, tag,
//					 MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, 1, Column_type, dest, tag,
//					  MPI_COMM_WORLD, &send_request4);
//			MPI_Irecv(val_ghost, 1, Column_type, source, tag,
//					  MPI_COMM_WORLD, &recv_request4);
//			#endif
//		}
//	}
//
//	/* Free the column data type */
//	#ifdef _MPI_H_
//	MPI_Type_free(&Column_type);
//	#endif
//	if(verbose){
//		printf("Matrix after sending and receiving columns\n");
//		print_matrix_compressed(*new_mat);
//	}
//	return true;
//}
//
//
//
//
///* Will send the row from the core matrix and receive
// * the row to the ghost row */
//bool send_recv_ghost_rows(matrix * new_mat){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(new_mat==NULL){
//		fprintf(stderr,"ERROR new_mat is NULL in send_recv_ghost_rows\n");
//		_return_error_val();
//		return false;
//	}
//	#endif
//	int tag = 0;
//	float * val_ghost;
//	float * val_core;
//	int row;
//	/* Will send each row, one at a time. First will
//	 * send in the direction indicated in the following
//	 * diagram:
//	 *
//	 *      |  Rank 0				top panel (panel 1) of matrix
//	 *      V | Rank 1				          (panel 2) of matrix
//	 *        V | Rank 2							:
//	 *          V | ...								:
//	 *            V Rank (num_proc-1)		  (panel num_proc) of matrix
//	 */
//
//	if(verbose){
//		printf("Matrix to send and receive rows\n");
//		print_matrix_compressed(*new_mat);
//	}
//	dest   = grid_index((my_grid_row+1+grid_dim_row)%(grid_dim_row),my_grid_col);
//	source = grid_index((my_grid_row-1+grid_dim_row)%(grid_dim_row),my_grid_col);
//
//	int ghost_rows = 0;
//	int ghost_rows_top = 0;
//	int ghost_rows_bottom = 0;
//
//	if((*new_mat)->row_start>0){
//		ghost_rows_top = (*new_mat)->row_start;
//	}
//	if(((*new_mat)->rows-(*new_mat)->row_end)>0){
//		ghost_rows_bottom = (*new_mat)->rows-(*new_mat)->row_end;
//	}
//
//	if(ghost_rows_top>ghost_rows_bottom){
//		ghost_rows = ghost_rows_top;
//	}else{
//		ghost_rows = ghost_rows_bottom;
//	}
//
//	if(my_grid_row==0){
//		/* Grab the float located at the first column of
//		 * the core new_matrix. We will grab the rows at the
//		 * bottom of the core new_matrix because there are
//		 * what we will be sending */
//		row = (*new_mat)->row_end-ghost_rows;
//		if(verbose){
//			printf("Rank %d sending value at ELEM(new_mat,%d,0)=%f to %d\n",my_rank,row, ELEM(*new_mat,row,0),dest);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//
//		val_core = &(ELEM(*new_mat,row,0));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD,&send_request1);
//			#endif
//		}
//	}else if(my_grid_row==(grid_dim_row-1)){
//		/* Grab the float located at the first column in
//		 * the bottom ghost row. This is where we will be
//		 * receiving from */
//		row = 0;
//		if(verbose){
//			printf("Rank %d receiving value at ELEM(new_mat,%d,0)=%f from %d\n",my_rank,row,ELEM(*new_mat,row,0),source);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//
//		val_ghost=&(ELEM((*new_mat),row,0));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Recv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Irecv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &recv_request1);
//			#endif
//		}
//
//	}else{
//		/* Grab the float located at the first column of
//		 * the core new_matrix. We will grab the rows at the
//		 * bottom of the core new_matrix because there are
//		 * what we will be sending */
//		row = (*new_mat)->row_end-ghost_rows;
//		val_core = &(ELEM((*new_mat),row,0));
//		/* Grab the float located at the first column in
//		 * the bottom ghost row. This is where we will be
//		 * receiving from */
//		row = 0;
//		val_ghost=&(ELEM((*new_mat),row,0));
//		/* If rank 0 sending and receiving to proc 1
//		 * sending bottom row of core new_matrix of proc 0
//		 * to top ghost row of proc 1. Note that the
//		 * last rank does not participate */
//		if(verbose){
//			printf("Rank %d Sending to %d and Receiving from %d\n",
//					my_rank, dest, source);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD);
//			MPI_Recv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD, &send_request1);
//			MPI_Irecv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &recv_request1);
//			#endif
//		}
//
//	}
//
//	/* Will send each row, one at a time. Will now
//	 * send in the direction indicated in the following
//	 * diagram:
//	 *
//	 *      A  Rank 0				top panel (panel 1) of new_matrix
//	 *      | A Rank 1				          (panel 2) of new_matrix
//	 *        | A Rank 2							:
//	 *          | A ...								:
//	 *            | Rank (num_proc-1)		  (panel num_proc) of new_matrix
//	 */
//
//	/* Switch the source and destination processors
//	 * will now be receiving from */
//	dest   = grid_index((my_grid_row-1+grid_dim_row)%(grid_dim_row),my_grid_col);
//	source = grid_index((my_grid_row+1+grid_dim_row)%(grid_dim_row),my_grid_col);
//
//	/* Increment until we have sent all of the ghost_rows
//	 * located on the top of the core new_matrix */
//	tag = 1;
//
//	/* Sending top row and receiving to bottom row */
//	if(my_grid_row==0){
//		/* Grab the float located at the first column in
//		 * the top ghost row. This is where we will be receiving
//		 * from.*/
//		/* Note we minus 1 from the ghost row here because we are
//		 * starting on the ghost row with (*new_mat)->row_end*/
//		row = (*new_mat)->row_end;
//		if(verbose){
//			printf("Rank %d receiving value at ELEM(new_mat,%d,0)=%f from %d\n",my_rank,row,get_elem(*new_mat,row,0),source);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//		val_ghost= &(ELEM((*new_mat),row,0));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Recv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Irecv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &recv_request2);
//			#endif
//		}
//	}else if(my_grid_row==(grid_dim_row-1)){
//		/* Grab the float located at the first column of
//		 * the core new_matrix. We will grab the rows at the bottom
//		 * of the core new_matrix because these are what we will be
//		 * sending to the top of the destinations processors ghost
//		 * row */
//		row = (*new_mat)->row_start;
//		if(verbose){
//			printf("Rank %d sending value at ELEM(new_mat,%d,0)=%f to %d\n",my_rank,row,get_elem(*new_mat,row,0),dest);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//		val_core=&(ELEM((*new_mat),row,0));
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD, &send_request2);
//			#endif
//		}
//	}else{
//		/* Grab the float located at the first column of
//		 * the core new_matrix. We will grab the rows at the bottom
//		 * of the core new_matrix because these are what we will be
//		 * sending to the top of the destinations processors ghost
//		 * row */
//		row = (*new_mat)->row_start;
//		val_core=&(ELEM((*new_mat),row,0));
//		/* Grab the float located at the first column in
//		 * the top ghost row. This is where we will be receiving
//		 * from.*/
//		row = (*new_mat)->row_end;
//		val_ghost=&(ELEM((*new_mat),row,0));
//		/* Notice that rank 0 does not participate because
//		 * it does not have a top ghost row and our World is
//		 * not periodic. */
//		if(verbose){
//			printf("Rank %d Sending to %d and Receiving from %d\n",
//					my_rank, dest, source);
//			printf("Sending total of %d columns\n",(*new_mat)->cols);
//		}
//		if(send_recv_sync){
//			#ifdef _MPI_H_
//			MPI_Send(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD);
//			MPI_Recv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &status);
//			#endif
//		}else{
//			#ifdef _MPI_H_
//			MPI_Isend(val_core, (*new_mat)->cols*ghost_rows, MPI_FLOAT, dest, tag,
//					MPI_COMM_WORLD, &send_request2);
//			MPI_Irecv(val_ghost, (*new_mat)->cols*ghost_rows, MPI_FLOAT, source, tag,
//					MPI_COMM_WORLD, &recv_request2);
//			#endif
//		}
//	}
//
//	if(verbose){
//		printf("Matrix after sending and receiving rows\n");
//		print_matrix_compressed(*new_mat);
//	}
//	return true;
//}
//
//bool within_core_matrix(const_matrix mat, int i, int j){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(mat==NULL){
//		fprintf(stderr,"ERROR mat is NULL in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	if(i<0){
//		fprintf(stderr,"ERROR i is less than 0 in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	if(j<0){
//		fprintf(stderr,"ERROR j is less than 0 in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	if(i>=mat->rows){
//		fprintf(stderr,"ERROR i is larger than or equal to the number of"
//                       " rows in mat in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	if(j>=mat->cols){
//		fprintf(stderr,"ERROR j is larger than or equal to the number of"
//                       " cols in mat in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	#endif
//
//	if(i<mat->row_start){
//		return false;
//	}else if(i>=mat->row_end){
//		return false;
//	}else if(j<mat->col_start){
//		return false;
//	}else if(j>=mat->col_end){
//		return false;
//	}else{
//		return true;
//	}
//
//}
//
//bool within_core_matrix_with_ghost(const_matrix mat, int i, int j, int ghost){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(mat==NULL){
//		fprintf(stderr,"ERROR mat is NULL in within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	if(i<0){
//		fprintf(stderr,"ERROR i is less than 0 in within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	if(j<0){
//		fprintf(stderr,"ERROR j is less than 0 in within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	if(i>=mat->rows){
//		fprintf(stderr,"ERROR i is larger than or equal to the number of"
//                       " rows in mat in within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	if(j>=mat->cols){
//		fprintf(stderr,"ERROR j is larger than or equal to the number of"
//                       " cols in mat in within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	if(ghost<0){
//		fprintf(stderr,"ERROR ghost is less than 0 in "
//                       "within_core_matrix_with_ghost\n");
//		_return_error_val();
//		return false;
//	}
//	#endif
//
//	if(i<(mat->row_start-ghost)){
//		return false;
//	}else if(i>=(mat->row_end+ghost)){
//		return false;
//	}else if(j<(mat->col_start-ghost)){
//		return false;
//	}else if(j>=(mat->col_end+ghost)){
//		return false;
//	}else{
//		return true;
//	}
//
//}
//
//
//bool within_matrix(const_matrix mat, int i, int j){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(mat==NULL){
//		fprintf(stderr,"ERROR mat is NULL in within_core_matrix\n");
//		_return_error_val();
//		return false;
//	}
//	#endif
//
//	if(i<0){
//		return false;
//	}else if(j<0){
//		return false;
//	}else if(i>=mat->rows){
//		return false;
//	}else if(j>=mat->cols){
//		return false;
//	}else{
//		return true;
//	}
//}
//
//int generate_data_file(char * filename, matrix mat){
//
//	int i;
//	int j;
//	FILE * fid;
//	fid = fopen(filename,"w");
//
//	for(j=0;j<get_cols(mat);j++){
//		for(i=0;i<get_rows(mat);i++){
//			fprintf(fid,"%6d ",(int)get_elem(mat,i,j));
//		}
//		fprintf(fid,"\n");
//	}
//	fclose(fid);
//	return 0;
//}
//
//float add_all_surrounding_elems(const_matrix orig_mat, int i, int j){
//
//	#ifdef _ERROR_CHECKING_ON_
//	if(orig_mat==NULL){
//		fprintf(stderr,"ERROR *orig_mat is NULL in "
//                       "add_all_surrounding_elems\n");
//		return (float) _return_error_val();
//	}
//    if(i<0){
//        fprintf(stderr,"ERROR row is less than 0 in "
//                       "add_all_surrounding_elems\n");
//		return (float) _return_error_val();
//    }
//    if(j<0){
//        fprintf(stderr,"ERROR col is less than 0 in "
//                       "add_all_surrounding_elems\n");
//		return (float) _return_error_val();
//    }
//    if(i>=orig_mat->rows){
//        fprintf(stderr,"ERROR row greater than rows in matrix "
//                       "add_all_surrounding_elems\n");
//		return (float) _return_error_val();
//    }
//    if(j>=orig_mat->cols){
//        fprintf(stderr,"ERROR col greater than cols in matrix "
//                       "add_all_surrounding_elems\n");
//		return (float) _return_error_val();
//    }
//	#endif
//	float sum = 0.0;
//    float value;
//    float NW;
//    float N;
//    float NE;
//    float E;
//    float W;
//    float SW;
//    float S;
//    float SE;
//
//    value = get_elem(orig_mat,i,j);
//    if(within_matrix(orig_mat,i-1,j-1)){
//        NW = get_elem(orig_mat,i-1,j-1);
//        sum += NW;
//    }
//    if(within_matrix(orig_mat,i,j-1)){
//        N = get_elem(orig_mat,i,j-1);
//        sum += N;
//    }
//    if(within_matrix(orig_mat,i+1,j-1)){
//        NE = get_elem(orig_mat,i+1,j-1);
//        sum += NE;
//    }
//    if(within_matrix(orig_mat,i-1,j)){
//        W = get_elem(orig_mat,i-1,j);
//        sum += W;
//    }
//    if(within_matrix(orig_mat,i+1,j)){
//        E = get_elem(orig_mat,i+1,j);
//        sum += E;
//    }
//    if(within_matrix(orig_mat,i-1,j+1)){
//        SW = get_elem(orig_mat,i-1,j+1);
//        sum += SW;
//    }
//    if(within_matrix(orig_mat,i,j+1)){
//        S = get_elem(orig_mat,i,j+1);
//        sum += S;
//    }
//	if(within_matrix(orig_mat,i+1,j+1)){
//		SE = get_elem(orig_mat,i+1,j+1);
//		sum += SE;
//	}
//
//	return sum;
//
//}
