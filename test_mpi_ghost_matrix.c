/******************************************************************************
 *          Joshua Brown
 *          Scientific Computing
 *          test_mpi_ghost_matrix.c function
 *
 *
 * This function tests the following functions:
 *		o new_matrix
 *      o print_matrix
 *      o delete_matrix
 *      o get_rows
 *      o get_cols
 *		o get_total_elems
 *		o new_matrix_row_panel
 *      o set_elem_core_matrix
 *      o get_elem_core_matrix
 *      o set_elem_top_row_ghost_matrix
 *		o get_elem_top_row_ghost_matrix
 *      o set_elem_bottom_row_ghost_matrix
 *		o get_elem_bottom_row_ghost_matrix
 *      o get_rows_core_matrix
 *      o get_cols_core_matrix
 */
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#ifdef _MPI_H_
#include "mpi.h"
#endif
#include "mpi_ghost_matrix.h"

int main(void){

	printf("Testing: newGhostMatrix\n");
	ghost_matrix * gmat = newGhostMatrix(0,1);
	assert(gmat==NULL);
	gmat = newGhostMatrix(1,0); assert(gmat==NULL);
	gmat = newGhostMatrix(1,1);
	assert(gmat!=NULL);

	printf("Testing: printGhostMatrix\n");
	int rv = printGhostMatrix(NULL);
	assert(rv==-1);
	rv = printGhostMatrix(gmat);
	assert(rv==0);

	printf("Testing: deleteGhostMatrix\n");
	rv = deleteGhostMatrix(NULL);
	assert(rv==-1);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);

	printf("Testing: newGhostMatrixRowPanel\n");
	gmat = newGhostMatrixRowPanel(0, 1, 0, 0);
	assert(gmat==NULL);
	gmat = newGhostMatrixRowPanel(1, 0, 0, 0);
	assert(gmat==NULL);
	gmat = newGhostMatrixRowPanel(1, 1, -1, 0);
	assert(gmat==NULL);
	gmat = newGhostMatrixRowPanel(1, 1, 0, -1);
	assert(gmat==NULL);
	gmat = newGhostMatrixRowPanel(1, 1, 0, 0);
	assert(gmat!=NULL);
	printf("Only Core gmatrix 1,1\n");
	printGhostMatrix(gmat);
	rv = deleteGhostMatrix(&gmat);
	assert(rv == 0);
	assert(gmat==NULL);
	printf("Ghost row on the top of a 2,2 gmatrix\n");
	gmat = newGhostMatrixRowPanel(2, 2, 1, 0);
	assert(gmat!=NULL);
	rv = printGhostMatrix(gmat);
  assert(rv==0);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);
	printf("Ghost row on the bottom of a 3,3 gmatrix\n");
	gmat = newGhostMatrixRowPanel(3, 3, 0, 1);
	assert(gmat!=NULL);
	rv = printGhostMatrix(gmat);
	assert(rv == 0);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);
	printf("Ghost row above and below a 2,2 gmatrix\n");
	gmat = newGhostMatrixRowPanel(2, 2, 1, 1);
	assert(gmat!=NULL);
	rv = printGhostMatrix(gmat);
	assert(rv==0);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);


	printf("Testing newGhostMatrixCheckerboard\n");
	ghost_matrix * checker = newGhostMatrixCheckerboard(0,4,0,0,0,0);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,0,0,0,0,0);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,4,-1,0,0,0);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,4,0,-1,0,0);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,4,0,0,-1,0);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,4,0,0,0,-1);
	assert(checker==NULL);
	checker = newGhostMatrixCheckerboard(3,4,0,0,0,0);
	assert(checker!=NULL);
	rv = printGhostMatrix(checker);
	assert(rv==0);
	rv = deleteGhostMatrix(&checker);
	assert(rv==0);
	assert(checker==NULL);

	printf("Testing: printCompGhostMatrix\n");
	gmat = newGhostMatrix(3,3);
	rv = printCompGhostMatrix(NULL);
	assert(rv==-1);
	rv = printCompGhostMatrix(gmat);
	assert(rv==0);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

/* Testing Setters                                                            */
	printf("Testing: setElemGhostMatrix\n");
	gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
	assert(gmat!=NULL);
	printCompGhostMatrix(gmat);
	rv = setElemGhostMatrix(NULL,0,0,2.0);
	assert(rv==-1);
	rv = setElemGhostMatrix(gmat, -1,0,2.0);
	assert(rv==-1);
	rv = setElemGhostMatrix(gmat, 0,-1,2.0);
	assert(rv==-1);
	rv = setElemGhostMatrix(gmat, 0, 0,2.0);
	assert(rv==0);
	printCompGhostMatrix(gmat);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: setAllGhostMatrix");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	assert(gmat!=NULL);
	printGhostMatrix(gmat);
	rv = setAllGhostMatrix(NULL,3.0);
	assert(rv==-1);
	printGhostMatrix(gmat);
	rv = setAllGhostMatrix(gmat,3.5);
	assert(rv==0);
	printCompGhostMatrix(gmat);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: setElemCoreGhostMatrix\n");
	gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
	assert(gmat!=NULL);
	printCompGhostMatrix(gmat);
	rv = setElemCoreGhostMatrix(NULL,0,0,2.0);
	assert(rv==-1);
	rv = setElemCoreGhostMatrix(gmat, -1,0,2.0);
	assert(rv==-1);
	rv = setElemCoreGhostMatrix(gmat, 0,-1,2.0);
	assert(rv==-1);
	rv = setElemCoreGhostMatrix(gmat, 0, 0,2.0);
	assert(rv==0);
	printCompGhostMatrix(gmat);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

/* Getters                                                                    */
	printf("Testing: getRowStartGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getRowStartGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowStartGhostMatrix(gmat);
	assert(rv==1);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getRowEndGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getRowEndGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowEndGhostMatrix(gmat);
	assert(rv==4);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getRowsGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getRowsGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowsGhostMatrix(gmat);
	assert(rv==5);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColStartGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getColStartGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColStartGhostMatrix(gmat);
	assert(rv==1);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColEndGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getColEndGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColEndGhostMatrix(gmat);
	assert(rv==5);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColsGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getColsGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColsGhostMatrix(gmat);
	assert(rv==6);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getTotalGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getTotalGhostMatrix(NULL);
	assert(rv==-1);
	rv = getTotalGhostMatrix(gmat);
	assert(rv==30);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getRowsCoreGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getRowsCoreGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowsCoreGhostMatrix(gmat);
	assert(rv==3);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColsCoreGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getColsCoreGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColsCoreGhostMatrix(gmat);
	assert(rv==4);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getTotalCoreGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
	rv = getTotalCoreGhostMatrix(NULL);
	assert(rv==-1);
	rv = getTotalCoreGhostMatrix(gmat);
	assert(rv==12);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColsWestGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
	rv = getColsWestGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColsWestGhostMatrix(gmat);
	assert(rv==4);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getColsEastGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
	rv = getColsEastGhostMatrix(NULL);
	assert(rv==-1);
	rv = getColsEastGhostMatrix(gmat);
	assert(rv==3);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getRowsSouthGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
	rv = getRowsSouthGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowsSouthGhostMatrix(gmat);
	assert(rv==2);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);

	printf("Testing: getRowsNorthGhostMatrix\n");
	gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
	rv = getRowsNorthGhostMatrix(NULL);
	assert(rv==-1);
	rv = getRowsNorthGhostMatrix(gmat);
	assert(rv==1);
	rv = deleteGhostMatrix(&gmat);
	assert(rv==0);
	assert(gmat==NULL);
//	printf("Testing: get_cols_core_matrix\n");
//	rv = get_cols_core_matrix(NULL);
//	assert(rv==-1);
//	rv = get_cols_core_matrix(mat);
//	assert(rv==2);

//	mat = new_matrix(2,3);
//	assert(mat!=NULL);
//	printf("Testing: get_rows\n");
//	rv = get_rows(NULL);
//	assert(rv==-1);
//	rv = get_rows(mat);
//	assert(rv==2);
//
//	printf("Testing: get_cols\n");
//	rv = get_cols(NULL);
//	assert(rv==-1);
//	rv = get_cols(mat);
//	assert(rv==3);
//
//	printf("Testing: get_total_elems\n");
//	rv = get_total_elems(NULL);
//	assert(rv==-1);
//	rv = get_total_elems(mat);
//	assert(rv==(2*3));
//	delete_matrix(&mat);
//


//	rvd = get_elem_core_matrix(mat, 0, 0);
//	assert(rvd==2.0);

//	rvd = get_elem_core_matrix(NULL, 2, 1);
//	assert(rvd==-1.0);
//	rvd = get_elem_core_matrix(mat, 3,1);
//	assert(rvd==-1.0);
//	rvd = get_elem_core_matrix(mat, 2,2);
//	assert(rvd==-1.0);
//	rvd = get_elem_core_matrix(mat, -1, 0);
//	assert(rvd==-1.0);
//	rvd = get_elem_core_matrix(mat, 0, -1);
//	assert(rvd==-1.0);
//	rvd = get_elem_core_matrix(mat, 0, 0);
//	assert(rvd==2.0);
//	print_matrix(mat);
//
//	printf("Testing: set_elem_top_row_ghost_matrix\n");
//	rv = set_elem_top_row_ghost_matrix(NULL,0,0,21.3);
//	assert(rv==-1);
//	rv = set_elem_top_row_ghost_matrix(mat,1,0,23.8);
//	assert(rv==-1);
//	rv = set_elem_top_row_ghost_matrix(mat,0,2,98);
//	assert(rv==-1);
//	rv = set_elem_top_row_ghost_matrix(mat,0,1,7);
//	assert(rv==0);
//	rv = set_elem_top_row_ghost_matrix(mat,-1,0,54);
//	assert(rv==-1);
//	rv = set_elem_top_row_ghost_matrix(mat,0,-1,42);
//	assert(rv==-1);
//	rv = set_elem_top_row_ghost_matrix(mat,0,0,84);
//	assert(rv==0);
//
//	printf("Testing: get_elem_top_row_ghost_matrix\n");
//	rvd = get_elem_top_row_ghost_matrix(NULL,0,0);
//	assert(rvd==-1.0);
//	rvd = get_elem_top_row_ghost_matrix(mat,-1,0);
//	assert(rvd==-1.0);
//	rvd = get_elem_top_row_ghost_matrix(mat,0,-1);
//	assert(rvd==-1.0);
//	rvd = get_elem_top_row_ghost_matrix(mat,1,0);
//	assert(rvd==-1);
//	rvd = get_elem_top_row_ghost_matrix(mat,0,2);
//	assert(rvd==-1.0);
//	rvd = get_elem_top_row_ghost_matrix(mat,0,1);
//	assert(rvd==7);
//	rvd = get_elem_top_row_ghost_matrix(mat,0,0);
//	assert(rvd==84);
//
//	printf("Testing: set_elem_bottom_row_ghost_matrix\n");
//	rv = set_elem_bottom_row_ghost_matrix(NULL,0,0,21.3);
//	printf("1\n");
//	assert(rv==-1);
//	rv = set_elem_bottom_row_ghost_matrix(mat,1,0,23.8);
//	printf("2\n");
//	assert(rv==-1);
//	rv = set_elem_bottom_row_ghost_matrix(mat,0,2,98);
//	printf("3\n");
//	assert(rv==-1);
//	rv = set_elem_bottom_row_ghost_matrix(mat,0,0,7);
//	printf("4\n");
//	assert(rv==0);
//	rv = set_elem_bottom_row_ghost_matrix(mat,-1,0,54);
//	printf("5\n");
//	assert(rv==-1);
//	rv = set_elem_bottom_row_ghost_matrix(mat,0,-1,42);
//	printf("6\n");
//	assert(rv==-1);
//	rv = set_elem_bottom_row_ghost_matrix(mat,0,1,84);
//	printf("7\n");
//	assert(rv==0);
//
//	printf("Testing: get_elem_bottom_row_ghost_matrix\n");
//	rvd = get_elem_bottom_row_ghost_matrix(NULL,0,0);
//	assert(rvd==-1.0);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,-1,0);
//	assert(rvd==-1.0);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,0,-1);
//	assert(rvd==-1.0);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,1,0);
//	assert(rvd==-1);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,0,2);
//	assert(rvd==-1.0);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,0,0);
//	assert(rvd==7);
//	rvd = get_elem_bottom_row_ghost_matrix(mat,0,1);
//	assert(rvd==84);
//	print_matrix(mat);
//

//
//	printf("Testing: sum_all_core_matrix_elems\n");
//	rvd = sum_all_core_matrix_elems(NULL);
//	assert(rvd==-1.0);
//	rvd = sum_all_core_matrix_elems(mat);
//	printf("sum %f\n",rvd);
//	assert((int)rvd==10);
//
//	printf("Testing: within_core_matrix\n");
//	print_matrix(mat);
//	rvbool = within_core_matrix(NULL,1,1);
//	assert(rvbool==false);
//	rvbool = within_core_matrix(mat,0,0);
//	assert(rvbool==false);
//	rvbool = within_core_matrix(mat,4,0);
//	assert(rvbool==false);
//	rvbool = within_core_matrix(mat,1,1);
//	assert(rvbool==true);
//	delete_matrix(&mat);
//
//	/* Create blinker to test conways game of life */
//	mat = new_matrix(5,5);
//	new_mat = new_matrix(5,5);
//	set_elem(mat,2,2,1.0);
//
//	delete_matrix(&mat);
//	delete_matrix(&new_mat);
//

//
//	printf("Testing get_cols_left_ghost_matrix & get_cols_right_ghost_matrix\n");
//	rv = get_cols_left_ghost_matrix(NULL);
//	assert(rv==-1);
//	rv = get_cols_right_ghost_matrix(NULL);
//	assert(rv==-1);
//	rv = get_cols_left_ghost_matrix(checker);
//	assert(rv==0);
//	rv = get_cols_right_ghost_matrix(checker);
//	assert(rv==0);
//	delete_matrix(&checker);
//	checker = new_matrix_checkerboard_elem(3,4,0,0,1,0);
//	assert(checker!=NULL);
//	assert(get_rows(checker)==3);
//	assert(get_cols(checker)==5);
//	assert(get_rows_core_matrix(checker)==3);
//	assert(get_cols_core_matrix(checker)==4);
//	assert(get_cols_left_ghost_matrix(checker)==0);
//	assert(get_cols_right_ghost_matrix(checker)==1);
//	delete_matrix(&checker);
//	checker = new_matrix_checkerboard_elem(4,2,1,0,2,2);
//	assert(checker!=NULL);
//	print_matrix(checker);
//	assert(get_rows(checker)==5);
//	assert(get_cols(checker)==6);
//	assert(get_rows_core_matrix(checker)==4);
//	assert(get_cols_core_matrix(checker)==2);
//	assert(get_cols_left_ghost_matrix(checker)==2);
//	assert(get_cols_right_ghost_matrix(checker)==2);
//	delete_matrix(&checker);
	return 0;
}
