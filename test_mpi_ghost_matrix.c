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
 *      o getElemCoreGhostMatrix
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
    {
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
    }

    printf("Testing: newGhostMatrixRowPanel\n");
    {
        ghost_matrix * gmat = newGhostMatrixRowPanel(0, 1, 0, 0);
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
        int rv = deleteGhostMatrix(&gmat);
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
    }

    printf("Testing newGhostMatrixCheckerboard\n");
    {
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
        int rv = printGhostMatrix(checker);
        assert(rv==0);
        rv = deleteGhostMatrix(&checker);
        assert(rv==0);
        assert(checker==NULL);
    }

    printf("Testing: printCompGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrix(3,3);
        int rv = printCompGhostMatrix(NULL);
        assert(rv==-1);
        rv = printCompGhostMatrix(gmat);
        assert(rv==0);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    /* Testing Setters                                                            */
    printf("Testing: setElemGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
        assert(gmat!=NULL);
        printCompGhostMatrix(gmat);
        int rv = setElemGhostMatrix(NULL,0,0,2.0);
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
    }

    printf("Testing: setAllGhostMatrix");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        assert(gmat!=NULL);
        printGhostMatrix(gmat);
        int rv = setAllGhostMatrix(NULL,3.0);
        assert(rv==-1);
        printGhostMatrix(gmat);
        rv = setAllGhostMatrix(gmat,3.5);
        assert(rv==0);
        printCompGhostMatrix(gmat);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: setElemCoreGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
        assert(gmat!=NULL);
        printCompGhostMatrix(gmat);
        int rv = setElemCoreGhostMatrix(NULL,0,0,2.0);
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
    }
    /* Getters                                                                    */
    printf("Testing: getRowStartGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getRowStartGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowStartGhostMatrix(gmat);
        assert(rv==1);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getRowEndGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getRowEndGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowEndGhostMatrix(gmat);
        assert(rv==4);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getRowsGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getRowsGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowsGhostMatrix(gmat);
        assert(rv==5);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColStartGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getColStartGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColStartGhostMatrix(gmat);
        assert(rv==1);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColEndGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getColEndGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColEndGhostMatrix(gmat);
        assert(rv==5);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColsGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getColsGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColsGhostMatrix(gmat);
        assert(rv==6);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getTotalGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getTotalGhostMatrix(NULL);
        assert(rv==-1);
        rv = getTotalGhostMatrix(gmat);
        assert(rv==30);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getRowsCoreGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getRowsCoreGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowsCoreGhostMatrix(gmat);
        assert(rv==3);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColsCoreGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getColsCoreGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColsCoreGhostMatrix(gmat);
        assert(rv==4);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getTotalCoreGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
        int rv = getTotalCoreGhostMatrix(NULL);
        assert(rv==-1);
        rv = getTotalCoreGhostMatrix(gmat);
        assert(rv==12);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColsWestGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        int rv = getColsWestGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColsWestGhostMatrix(gmat);
        assert(rv==4);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getColsEastGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        int rv = getColsEastGhostMatrix(NULL);
        assert(rv==-1);
        rv = getColsEastGhostMatrix(gmat);
        assert(rv==3);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getRowsSouthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        int rv = getRowsSouthGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowsSouthGhostMatrix(gmat);
        assert(rv==2);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getRowsNorthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        int rv = getRowsNorthGhostMatrix(NULL);
        assert(rv==-1);
        rv = getRowsNorthGhostMatrix(gmat);
        assert(rv==1);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getElemGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrix(3,2);
        float rvf = getElemGhostMatrix(NULL,1,1);
        assert(rvf==-1.0);
        rvf = getElemGhostMatrix(gmat,-1,0);
        assert(rvf==-1.0);
        rvf = getElemGhostMatrix(gmat,0,-1);
        assert(rvf==-1.0);
        rvf = getElemGhostMatrix(gmat,3,0);
        assert(rvf==-1.0);
        rvf = getElemGhostMatrix(gmat,0,2);
        assert(rvf==-1.0);
        rvf = getElemGhostMatrix(gmat,2,1);
        assert(rvf==0.0);
        rvf = getElemGhostMatrix(gmat,0,0);
        assert(rvf==0.0);
        int rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: copyGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrix(3,4);
        int rv = setAllGhostMatrix(gmat,1.1);
        assert(rv==0);
        for(int r=0;r<3;r++){
            for(int c=0;c<4;c++){
                float rvf = getElemGhostMatrix(gmat,r,c);
                float temp = 1.1;
                assert(rvf==temp);
            }
        }
        ghost_matrix * gmat2 = newGhostMatrix(3,4);
        rv = copyGhostMatrix(0,2,0,3,gmat,gmat2);
        assert(rv==0);
        for(int r=0;r<3;r++){
            for(int c=0;c<4;c++){
                float rvf = getElemGhostMatrix(gmat2,r,c);
                float temp = 1.1;
                assert(rvf==temp);
            }
        }
        rv = copyGhostMatrix(-1,2,0,3,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(2,1,0,3,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,3,0,3,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,2,-1,3,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,2,0,4,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,2,2,1,gmat,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,2,0,3,NULL,gmat2);
        assert(rv==-1);
        rv = copyGhostMatrix(0,2,0,3,gmat,NULL);
        assert(rv==-1);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
        rv = deleteGhostMatrix(&gmat2);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getElemCoreGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        float rvf = getElemCoreGhostMatrix(gmat, 0, 0);
        float temp = 0.0;
        assert(rvf==temp);
        rvf = getElemCoreGhostMatrix(gmat, 4, 4);
        assert(rvf==temp);
        temp = -1.0;
        rvf = getElemCoreGhostMatrix(NULL, 0, 0);
        assert(rvf==temp);
        rvf = getElemCoreGhostMatrix(gmat, -1, 0);
        assert(rvf==temp);
        rvf = getElemCoreGhostMatrix(gmat, 5, 0);
        assert(rvf==temp);
        rvf = getElemCoreGhostMatrix(gmat, 0, -1);
        assert(rvf==temp);
        rvf = getElemCoreGhostMatrix(gmat, 0, 5);
        assert(rvf==temp);
        int rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: sumAllCoreMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
        int rv = setAllGhostMatrix(gmat,1.0);
        assert(rv==0);
        float rvf = sumAllCoreMatrix(NULL);
        assert(rvf==-1.0);
        rvf = sumAllCoreMatrix(gmat);
        printf("rvf %f\n",rvf);
        assert((int)rvf==25);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: setElemNorthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(2,2,1,0,0,0);
        int rv = setElemNorthGhostMatrix(NULL,0,0,21.3);
        assert(rv==-1);
        rv = setElemNorthGhostMatrix(gmat,1,0,23.8);
        assert(rv==-1);
        rv = setElemNorthGhostMatrix(gmat,0,2,98);
        assert(rv==-1);
        rv = setElemNorthGhostMatrix(gmat,0,1,7);
        assert(rv==0);
        rv = setElemNorthGhostMatrix(gmat,-1,0,54);
        assert(rv==-1);
        rv = setElemNorthGhostMatrix(gmat,0,-1,42);
        assert(rv==-1);
        rv = setElemNorthGhostMatrix(gmat,0,0,84);
        assert(rv==0);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getElemNorthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(2,2,1,0,0,0);
        float rvf = getElemNorthGhostMatrix(NULL,0,0);
        assert(rvf==-1.0);
        rvf = getElemNorthGhostMatrix(gmat,-1,0);
        assert(rvf==-1.0);
        rvf = getElemNorthGhostMatrix(gmat,0,-1);
        assert(rvf==-1.0);
        rvf = getElemNorthGhostMatrix(gmat,1,0);
        assert(rvf==-1);
        rvf = getElemNorthGhostMatrix(gmat,0,2);
        assert(rvf==-1.0);
        int rv = setElemNorthGhostMatrix(gmat,0,1,7);
        assert(rv==0);
        rvf = getElemNorthGhostMatrix(gmat,0,1);
        assert(rvf==7);
        rv = setElemNorthGhostMatrix(gmat,0,0,84);
        assert(rv==0);
        rvf = getElemNorthGhostMatrix(gmat,0,0);
        assert(rvf==84);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: setElemSouthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(2,2,0,1,0,0);
        int rv = setElemSouthGhostMatrix(NULL,0,0,21.3);
        assert(rv==-1);
        rv = setElemSouthGhostMatrix(gmat,1,0,23.8);
        assert(rv==-1);
        rv = setElemSouthGhostMatrix(gmat,0,2,98);
        assert(rv==-1);
        rv = setElemSouthGhostMatrix(gmat,0,0,7);
        assert(rv==0);
        rv = setElemSouthGhostMatrix(gmat,-1,0,54);
        assert(rv==-1);
        rv = setElemSouthGhostMatrix(gmat,0,-1,42);
        assert(rv==-1);
        rv = setElemSouthGhostMatrix(gmat,0,1,84);
        assert(rv==0);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }

    printf("Testing: getElemSouthGhostMatrix\n");
    {
        ghost_matrix * gmat = newGhostMatrixCheckerboard(2,2,0,1,0,0);
        float rvf = getElemSouthGhostMatrix(NULL,0,0);
        assert(rvf==-1.0);
        rvf = getElemSouthGhostMatrix(gmat,-1,0);
        assert(rvf==-1.0);
        rvf = getElemSouthGhostMatrix(gmat,0,-1);
        assert(rvf==-1.0);
        rvf = getElemSouthGhostMatrix(gmat,1,0);
        assert(rvf==-1);
        rvf = getElemSouthGhostMatrix(gmat,0,2);
        assert(rvf==-1.0);
        int rv = setElemSouthGhostMatrix(gmat,0,0,7);
        assert(rv==0);
        rvf = getElemSouthGhostMatrix(gmat,0,0);
        assert(rvf==7);
        rv = setElemSouthGhostMatrix(gmat,0,1,84);
        assert(rv==0);
        rvf = getElemSouthGhostMatrix(gmat,0,1);
        assert(rvf==84);
        rv = deleteGhostMatrix(&gmat);
        assert(rv==0);
        assert(gmat==NULL);
    }


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
