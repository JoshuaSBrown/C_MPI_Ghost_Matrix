# /**************************************/
# /*
#  *          Joshua Brown
#  *          Scientific Computing
#  *          Makefile for test_mpi_ghost_matrix.c
#  *
#  */
# /**************************************/

CC=gcc
CFAGS=-Wall -Wextra -std=c99 -pedantic -g --save-temps

ALL : test_mpi_ghost_matrix

test_mpi_ghost_matrix : test_mpi_ghost_matrix.c mpi_ghost_matrix.o matrix.o
	$(CC) $(CFLAGS)  -D _ERROR_CHECKING_ON_ -o test_mpi_ghost_matrix test_mpi_ghost_matrix.c mpi_ghost_matrix.o matrix.o -lm

mpi_ghost_matrix.o : mpi_ghost_matrix.c matrix.o
	$(CC) -c -D _ERROR_CHECKING_ON_ -std=c99 mpi_ghost_matrix.c matrix.o

matrix.o : ../C_Matrix/C_MATRIX/matrix.c
	$(CC) -c -std=c99 -D _ERROR_CHECKING_ON_ ../C_Matrix/C_MATRIX/matrix.c

	#test_midterm_matrix : test_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -o test_midterm_matrix test_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o  -lpopt -lm

#test2_midterm_matrix : test2_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -o test2_midterm_matrix test2_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o  -lpopt -lm

#test3_midterm_matrix : test3_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -o test3_midterm_matrix test3_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o  -lpopt -lm

#test4_midterm_matrix : test4_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -o test4_midterm_matrix test4_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o  -lpopt -lm

#test5_midterm_matrix : test5_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -o test5_midterm_matrix test5_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o  -lpopt -lm

#test6_midterm_matrix : test6_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o midterm_io.o midterm_pprintf.o
#	$(CC) $(CFLAGS) -o test6_midterm_matrix test6_midterm_matrix.c midterm_matrix.o midterm_error.o midterm_constants.o midterm_io.o midterm_pprintf.o -lpopt -lm

#midterm_matrix.o : midterm_matrix.c midterm_error.o midterm_constants.o
#	$(CC) $(CFLAGS) -c midterm_matrix.c midterm_error.o midterm_constants.o

#midterm_error.o : ../MIDTERM_ERROR/midterm_error.c
#	$(CC) $(CFLAGS) -c ../MIDTERM_ERROR/midterm_error.c

#midterm_constants.o : ../MIDTERM_CONSTANTS/midterm_constants.c
#	$(CC) $(CFLAGS) -c ../MIDTERM_CONSTANTS/midterm_constants.c

#midterm_pprintf.o : ../MIDTERM_PPRINTF/midterm_pprintf.c
#	$(CC) $(CFLAGS) -c ../MIDTERM_PPRINTF/midterm_pprintf.c

#midterm_io.o : ../MIDTERM_IO/midterm_io.c
#	$(CC) $(CFLAGS) -c ../MIDTERM_IO/midterm_io.c

.PHONY : clean
clean :
	$(RM) *.o test_mpi_ghost_matrix
