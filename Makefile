# /**************************************/
# /*
#  *          Joshua Brown
#  *          Scientific Computing
#  *          Makefile for test_mpi_ghost_matrix.c
#  *
#  */
# /**************************************/

CC=gcc
#mpicc
CFLAGS=-Wall -Wextra -std=c99 -pedantic -g 

ALL : test_mpi_ghost_matrix

test_mpi_ghost_matrix : test_mpi_ghost_matrix.c mpi_ghost_matrix.o matrix.o
	$(CC) $(CFLAGS) -D _ERROR_CHECKING_ON_ -o test_mpi_ghost_matrix test_mpi_ghost_matrix.c mpi_ghost_matrix.o matrix.o -lm

mpi_ghost_matrix.o : mpi_ghost_matrix.c
	$(CC) -std=c99 -D _ERROR_CHECKING_ON_ -D _MPI_GHOST_MATRIX_MATRIX_PLUGIN_ -c mpi_ghost_matrix.c

matrix.o : ../../C_Matrix/C_MATRIX/matrix.c
	$(CC) -std=c99 -D _ERROR_CHECKING_ON_ -D _MPI_GHOST_MATRIX_MATRIX_PLUGIN_ -c ../../C_Matrix/C_MATRIX/matrix.c

.PHONY : clean
clean :
	$(RM) *.o test_mpi_ghost_matrix test_mpi_ghost_matrix.i test_mpi_ghost_matrix.s vgcore*
