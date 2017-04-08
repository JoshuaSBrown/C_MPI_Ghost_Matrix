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
 ******************************************************************************/
#include <stdbool.h>

#ifndef _MPI_GHOST_MATRIX_H_
#define _MPI_GHOST_MATRIX_H_

typedef struct _ghost_matrix ghost_matrix;

/* Creator                                                                    */
/* Create a new ghost_matrix of floating point numbers of dimensions rowsxcols*
 * The return value will be:                                                  *
 * NULL    - NULL pointer if malloc is unable to allocate memory in the heap  *
 * NonNULL - A valid pointer to a ghost_matrix                                */
ghost_matrix * newGhostMatrix(const int rows, const int cols);

/* Create a new ghost_matrix defined by core_rows and core_cols. If a value   *
 * greater than 0 is passed for to ghost_rows_north or ghost_rows_south the   *
 * matrix will have extended ghost rows above and or below it i.e.            *
 *                                                                            *
 * newGhostPanel(2,2,3,1) will yield a matrix that looks as follows:          *
 *                                                                            *
 *                        G G                                                 *
 *                        G G                                                 *
 *                        G G                                                 *
 *                        O O                                                 *
 *                        O O                                                 *
 *                        G G                                                 *
 *                                                                            *
 * G - ghost element                                                          *
 * O - core matrix element                                                    *
 *                                                                            *
 * The return value is given as:                                              *
 * NULL    - if there is not space in the heap or malformed input is detected *
 * NonNULL - A valid pointer to a ghost_matrix                                */
ghost_matrix * newGhostMatrixRowPanel(const int core_rows	      ,
                                      const int core_cols       ,
							                        const int ghost_row_north ,
                                      const int ghost_row_south );

/* Creates a new matrix with optional ghost rows and columns below, above,    *
 * left, and right of the core matrix. The ghost rows or cols must have a     *
 * value of 0 or greater to be valid input i.e.                               *
 *                                                                            *
 * newGhostMatrixCheckerboard(3,3,2,1,3,2) will yield a matrix that looks as  *
 * follows:                                                                   *
 *                                                                            *
 *                    G G G G G G G G                                         *
 *                    G G G G G G G G                                         *
 *                    G G O O O G G G                                         *
 *                    G G O O O G G G                                         *
 *                    G G O O O G G G                                         *
 *                    G G G G G G G G                                         *
 *                                                                            *
 * G - ghost element                                                          *
 * O - core matrix element                                                    *
 *                                                                            *
 * The return value is given as:                                              *
 * NULL    - if there is not space in the heap or malformed input is detected *
 * NonNULL - A valid pointer to a ghost_matrix                                */
 ghost_matrix * newGhostMatrixCheckerboard(const int core_rows	    ,
                                           const int core_cols      ,
 							                             const int ghost_row_north,
                                           const int ghost_row_south,
                                           const int ghost_col_east ,
                                           const int ghost_col_west );

/* Destructor                                                                 */
/* Function frees the ghost_matrix will return:                               *
 *  0 - if success                                                            *
 * -1 - if gmat is NULL                                                       */
int deleteGhostMatrix(ghost_matrix ** gmat);

/* Displayers                                                                 */
/* Print the contents of a matrix, using floating point numbers and prints the*
 * content of the ghost_matrix starting with the top ghost rows followed by   *
 * the core matrix and finally the bottom ghost rows. Will return:            *
 * -1 - if gmat is NULL                                                       *
 *  0 - if success                                                            */
int printGhostMatrix(const ghost_matrix * gmat);

/* Print the contents of a matrix in compressed form. Used to convert floating*
 * point numbers to a more concise interger format. This function is only     *
 * meant to be used with numbers between 0 and 999. The return value is:      *
 * -1 - if gmat is NULL                                                       *
 *  0 - if success                                                            */
int printCompGhostMatrix(const ghost_matrix * gmat);

/* Setters                                                                    */
/* Set the element within the matrix. The rows and columns are specified from *
 * row 0 and col 0 of the ghost_matrix, the ghost_matrix is treated as a      *
 * entity with no regard to ghost rows or columns. The return value is given: *
 * -1 - if gmat is NULL or r or c is out of bounds                            *
 *  0 - if success                                                            */
int setElemGhostMatrix(ghost_matrix* gmat,
                       const int r       ,
                       const int c       ,
                       const float val   );

/* Set all of the elements in the ghost_matrix to the value given by val. The *
 * return value is given as:                                                  *
 * -1 - if gmat is NULL                                                       *
 *  0 - if success                                                            */
int setAllGhostMatrix(ghost_matrix * gmat, const float val);

/* Set the value of an element in the core matrix whre r and c are the row and*
 * col of the core matrix. If r and c both are equal to 0 it refers to the    *
 * first element of the core matrix and not necessaily to the first element   *
 * in the ghost_matrix as a whole. Take for instance the matrix given by:     *
 *                                                                            *
 *                     G G G G G                                              *
 *                     G O O O G                                              *
 *                     G O O O G                                              *
 *                     G O O O G                                              *
 *                     G G G G G                                              *
 *                                                                            *
 * This matrix has a total of 5 rows and 5 columns. If I use the function with*
 * r and c equal to 0 I will get a value of O not G. If I use a value of r and*
 * c equal to 2 and 2 I will get a value of G. However, if I use a value or r *
 * equal to 2 and c equal to 3 I will get an out of bounds error because I am *
 * attempting to access an element that is not within the core matrix.        *
 *                                                                            *
 * The return values are given as:                                            *
 * -1 - if gmat is NULL or r or c is out of bounds                            *
 *  0 - if success                                                            */
 int setElemCoreGhostMatrix(ghost_matrix * gmat,
                            const int r        ,
                            const int c        ,
                            const float val    );

/* Getters                                                                    */
/* Gets the start of the matrix indicates the row the core matrix starts at.  *
 * Any row less than the value returned exists within the ghost row on the    *
 * north side of the matrix. The return value is given as:                    *
 * -1 - if gmat is NULL                                                       *
 * 0> - if success returns the row number                                     */
 int getRowStartGhostMatrix(const ghost_matrix * gmat);

/* Gets the end row of the core matrix any row
 * of equal or greater value is part of the bottom
 * ghost row.                                   *
 * -1 - if gmat is NULL                                                       *
 * 0> - if success returns the row number                                     */
int getRowEndGhostMatrix(const ghost_matrix * gmat);

/* Gets the col at the start of the core matrix
 * and value less than the column returned is part
 * of the left ghost column.                     *
 * -1  - if gmat is NULL                                                      *
 * 0>= - if success returns the col number                                    */
int getColStartGhostMatrix(const ghost_matrix * gmat);

/* Gets the col at the end of the core matrix any
 * column with a value greater or equal to the
 * value returned is part of the ghost column on
 * the right side of the core matrix.            *
 * -1  - if gmat is NULL                                                      *
 * 0>= - if success returns the col number                                    */
int getColEndGhostMatrix(const ghost_matrix * gmat);

/* Gets the total rows of the matrix including
 * rows in both top and bottom ghost matrices    *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or rows in the ghost_matrix            */
int getRowsGhostMatrix(const ghost_matrix * gmat);

/* Gets the total columns of the matrix including
 * columns in both the left and right ghost
 * columns.                                      *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or columns in the ghost_matrix         */
int getColsGhostMatrix(const ghost_matrix * gmat);

/* Gets the total number of elements in the matrix
 * including ghost columns and rows.             *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or elements in the ghost_matrix        */
int getTotalGhostMatrix(const ghost_matrix * gmat);

/* Gets the total number of rows in the core
 * matrix                                        *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or rows in the core part of the        *
 *       ghost_matrix                                                         */
int getRowsCoreGhostMatrix(const ghost_matrix * gmat);

/* Gets the total number of cols in the core
 * matrix                                       *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or columns in the core part of the     *
 *       ghost_matrix                                                         */
int getColsCoreGhostMatrix(const ghost_matrix * gmat);

/* Determines the total number of elements in the
 * core matrix. Excludes elements located in the
 * ghost rows and columns.                       *
 * -1  - if gmat is NULL                                                      *
 * 0>  - if success returns the number or elements in the core part of the    *
 *       ghost_matrix                                                         */
int getTotalCoreGhostMatrix(const ghost_matrix * gmat);

int getColsWestGhostMatrix(const ghost_matrix * gmat);

int getColsEastGhostMatrix(const ghost_matrix * gmat);

int getRowsNorthGhostMatrix(const ghost_matrix * gmat);

int getRowsSouthGhostMatrix(const ghost_matrix * gmat);

/* Grab the element located in the global matrix
 * or full matrix this includes both the core
 * matrix and the ghost matrices that pad the
 * sides if any exists. The row and col refer to
 * the position within this full matrix.         */
float getElemGhostMatrix(const ghost_matrix * gmat, const int r, const int c);

/* Copies the elements between and including
 * start_row to end_row
 * start_col to end_col
 * to a separate matrix the values are placed in
 * the new matrix starting at row and col (0,0) */
//int copy_matrix_elems(int start_row_elem   ,
//                      int end_row_elem     ,
//                      int start_col_elem   ,
//                      int end_col_elem     ,
//                      const_matrix mat_orig,
//                      matrix * mat_copy    );
//


///* Get an element from the core matrix this
// * excludes any elements in the ghost. Here row
// * and column refer to the rows and cols in the
// * core matrix not the global matrix.            */
//float get_elem_core_matrix(const_matrix mat, int row, int col);
//
///* Find the total value of all of the elements in
// * the core matrix and return the value. Excludes
// * elements in the ghost rows or columns.        */
//float sum_all_core_matrix_elems(const_matrix mat);
//
///* Allows you to change an element in the top
// * ghost row matrix. Here row and col refer to
// * the rows and columns within the ghost matrix
// * they do not refer to the row and column of the
// * global matrix                                 */
//int set_elem_top_row_ghost_matrix(matrix mat, int row, int col, float val);
//
///* Grab the element in the top ghost matrix
// * specified by row and col. Where row and col are
// * not refering to the rows and columns in the
// * global matrix.                                */
//float get_elem_top_row_ghost_matrix(const_matrix mat, int row, int col);
//
//int set_elem_bottom_row_ghost_matrix(matrix mat, int row, int col, float val);
//
//float get_elem_bottom_row_ghost_matrix(const_matrix mat, int row, int col);
//
//int get_ghost_cols_left(const_matrix mat);
//
//int get_ghost_cols_right(const_matrix mat);
//
//int get_ghost_rows_above(const_matrix mat);
//
//int get_ghost_rows_below(const_matrix mat);
//
///* Send a matrix using a derived MPI datatype    */
//int send_matrix(matrix mat);
//
///* Receive a matrix using a derived MPI datatype */
//int receive_matrix(matrix mat);
//
///* Send and receive ghost columns through a
// * derived MPI datatype. The total number of
// * columns sent and received will depend on the
// * value of ghost_count.
// */
//bool send_recv_ghost_cols(matrix * new_mat);
//
///* Send and receive ghost rows through a derived
// * MPI datatype. The total number of rows sent
// * and recieved will depend on the value of
// * ghost_count.                                  */
//bool send_recv_ghost_rows(matrix * new_mat);
//
///* Determine if a cell is alive depending on the
// * total number of bugs (sum) from the surrounding
// * cells.                                        */
//float live_cell(float sum, float cell);
//
//static inline void conways_condition(const_matrix orig_mat,
//                                     matrix * new_mat,
//                                     int i, int j,
//                                     int ghost);
//
///* Checks to see if the elements i,j is within
// * the core matrix if it is returns true if not
// * it returns false                              */
//bool within_core_matrix(const_matrix mat, int i, int j);
//
//bool within_core_matrix_with_ghost(const_matrix mat,
//                                   int i, int j,
//                                   int ghost);
//
///* Checks to see if the element i,j is within the
// * matrix mat. If it is it returns true otherwise
// * returns false.                                */
//bool within_matrix(const_matrix mat, int i, int j);
//
///* Simply generates an ascii data file for matlab
// * does not work in parallel                     */
//int generate_data_file(char * filename, matrix mat);
//
///* This function can run conways game for both
// * checkerboard and block row decompositions. It
// * is also able to take advantage of the ghost_rows
// * and ghost_columns if they exceed a single layer
// * this is done by doing extra calculations in
// * place of sending messages.
// */
//bool conways_game(matrix * orig_mat,
//                  matrix * temp,
//                  matrix * new_mat);
//
///* This function is used to test. It simply add all
// * of the elements surrouding i,j and returns the
// * sum                                           */
//float add_all_surrounding_elems(const_matrix orig_mat,
//                                int i, int j);
//
///* Designed to run conway's game of life on the
// * border of the matrix. The thickness of the
// * border is determined by ghost_count. In this
// * case conway's game of life is calculated for
// * the values stored in temp1 the result is put
// * in temp2. Returns a value of 0 if it exectued
// * correctly, if not returns a -1.               */
//int update_border_conway(matrix temp1,
//                         matrix * temp2,
//                         int k);
//
///* Used to update border of matrix executed
// * conways on mat1 and stores the result in mat2 */
//int set_elems_conway_rectangle(int col_start,
//                               int col_end,
//                               int row_start,
//                               int row_end,
//                               const_matrix mat1,
//                               matrix * mat2,
//                               int ghost);
//
///* Does the same thing as the above function with
// * the exception that when k is equal to the
// * (ghost_count-1) the final value is stored in
// * new. This function is used when calculating
// * the values within the margin.                 */
//int set_elems_conway_rectangle_rotation(
//                               int col_start,
//                               int col_end,
//                               int row_start,
//                               int row_end,
//                               const_matrix mat1,
//                               matrix *mat2,
//						       matrix *new_mat,
//                               int k);
//
//int update_conways_right(matrix orig,
//						  matrix temp,
//						  matrix new_mat,
//						  int k);
//
///*int update_conways_right_odd(matrix orig,
//                             matrix temp,
//                             matrix new_mat,
//                             int k);
//*/
//int update_conways_left(matrix orig,
//						 matrix temp,
//						 matrix new_mat,
//						 int k);
///*
//int update_conways_left_odd(matrix orig,
//                            matrix temp,
//                            matrix new_mat,
//                            int k);
//*/
#endif
