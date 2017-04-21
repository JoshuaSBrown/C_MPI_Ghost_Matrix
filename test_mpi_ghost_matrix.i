# 1 "test_mpi_ghost_matrix.c"
# 1 "/mnt/d/jbrown/Documents/Code/C_Code/C_MPI_Ghost_Matrix/C_MPI_Ghost_Matrix//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "test_mpi_ghost_matrix.c"
# 24 "test_mpi_ghost_matrix.c"
# 1 "/usr/include/stdlib.h" 1 3 4
# 24 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 374 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 385 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 386 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 375 "/usr/include/features.h" 2 3 4
# 398 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 399 "/usr/include/features.h" 2 3 4
# 25 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4


# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 206 "/usr/include/stdlib.h" 3 4


__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 372 "/usr/include/stdlib.h" 3 4


extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));

# 464 "/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 513 "/usr/include/stdlib.h" 3 4


extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 530 "/usr/include/stdlib.h" 3 4

# 539 "/usr/include/stdlib.h" 3 4




extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));













extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 712 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 742 "/usr/include/stdlib.h" 3 4
typedef int (*__compar_fn_t) (const void *, const void *);
# 752 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 775 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 860 "/usr/include/stdlib.h" 3 4



extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));

# 955 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 956 "/usr/include/stdlib.h" 2 3 4
# 968 "/usr/include/stdlib.h" 3 4

# 25 "test_mpi_ghost_matrix.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4




# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 154 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 177 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 245 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 293 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 302 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 338 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 390 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 434 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4
# 108 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));














extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;

# 232 "/usr/include/stdio.h" 3 4





extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 329 "/usr/include/stdio.h" 3 4



extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

# 351 "/usr/include/stdio.h" 3 4





extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 420 "/usr/include/stdio.h" 3 4





extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 443 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 494 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 565 "/usr/include/stdio.h" 3 4








extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 617 "/usr/include/stdio.h" 3 4





extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 684 "/usr/include/stdio.h" 3 4





extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 744 "/usr/include/stdio.h" 3 4





extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

# 841 "/usr/include/stdio.h" 3 4





extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 854 "/usr/include/stdio.h" 2 3 4
# 943 "/usr/include/stdio.h" 3 4

# 26 "test_mpi_ghost_matrix.c" 2
# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 27 "test_mpi_ghost_matrix.c" 2




# 1 "mpi_ghost_matrix.h" 1
# 35 "mpi_ghost_matrix.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdbool.h" 1 3 4
# 36 "mpi_ghost_matrix.h" 2




typedef struct _ghost_matrix ghost_matrix;






ghost_matrix * newGhostMatrix(const int rows, const int cols);
# 68 "mpi_ghost_matrix.h"
ghost_matrix * newGhostMatrixRowPanel(const int core_rows ,
                                      const int core_cols ,
                               const int ghost_row_north ,
                                      const int ghost_row_south );
# 93 "mpi_ghost_matrix.h"
 ghost_matrix * newGhostMatrixCheckerboard(const int core_rows ,
                                           const int core_cols ,
                                     const int ghost_row_north,
                                           const int ghost_row_south,
                                           const int ghost_col_east ,
                                           const int ghost_col_west );





int deleteGhostMatrix(ghost_matrix ** gmat);







int printGhostMatrix(const ghost_matrix * gmat);






int printCompGhostMatrix(const ghost_matrix * gmat);







int setElemGhostMatrix(ghost_matrix* gmat,
                       const int r ,
                       const int c ,
                       const float val );





int setAllGhostMatrix(ghost_matrix * gmat, const float val);
# 158 "mpi_ghost_matrix.h"
 int setElemCoreGhostMatrix(ghost_matrix * gmat,
                            const int r ,
                            const int c ,
                            const float val );







 int getRowStartGhostMatrix(const ghost_matrix * gmat);





int getRowEndGhostMatrix(const ghost_matrix * gmat);





int getColStartGhostMatrix(const ghost_matrix * gmat);






int getColEndGhostMatrix(const ghost_matrix * gmat);





int getRowsGhostMatrix(const ghost_matrix * gmat);





int getColsGhostMatrix(const ghost_matrix * gmat);





int getTotalGhostMatrix(const ghost_matrix * gmat);





int getRowsCoreGhostMatrix(const ghost_matrix * gmat);





int getColsCoreGhostMatrix(const ghost_matrix * gmat);






int getTotalCoreGhostMatrix(const ghost_matrix * gmat);

int getColsWestGhostMatrix(const ghost_matrix * gmat);

int getColsEastGhostMatrix(const ghost_matrix * gmat);

int getRowsNorthGhostMatrix(const ghost_matrix * gmat);

int getRowsSouthGhostMatrix(const ghost_matrix * gmat);




float getElemGhostMatrix(const ghost_matrix * gmat, const int r, const int c);






int copyGhostMatrix (const int start_row_elem ,
                      const int end_row_elem ,
                      const int start_col_elem ,
                      const int end_col_elem ,
                      const ghost_matrix * gmat_orig,
                      ghost_matrix * gmat_copy );






float getElemCoreGhostMatrix(const ghost_matrix * gmat,
                             const int row,
                             const int col);
# 32 "test_mpi_ghost_matrix.c" 2

int main(void){

 printf("Testing: newGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrix(0,1);
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 38, __PRETTY_FUNCTION__));
 gmat = newGhostMatrix(1,0); ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 39, __PRETTY_FUNCTION__));
 gmat = newGhostMatrix(1,1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 41, __PRETTY_FUNCTION__));

 printf("Testing: printGhostMatrix\n");
 int rv = printGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 45, __PRETTY_FUNCTION__));
 rv = printGhostMatrix(gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 47, __PRETTY_FUNCTION__));

 printf("Testing: deleteGhostMatrix\n");
 rv = deleteGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 51, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 53, __PRETTY_FUNCTION__));
 }

 printf("Testing: newGhostMatrixRowPanel\n");
 {
 ghost_matrix * gmat = newGhostMatrixRowPanel(0, 1, 0, 0);
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 59, __PRETTY_FUNCTION__));
 gmat = newGhostMatrixRowPanel(1, 0, 0, 0);
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 61, __PRETTY_FUNCTION__));
 gmat = newGhostMatrixRowPanel(1, 1, -1, 0);
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 63, __PRETTY_FUNCTION__));
 gmat = newGhostMatrixRowPanel(1, 1, 0, -1);
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 65, __PRETTY_FUNCTION__));
 gmat = newGhostMatrixRowPanel(1, 1, 0, 0);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 67, __PRETTY_FUNCTION__));
 printf("Only Core gmatrix 1,1\n");
 printGhostMatrix(gmat);
 int rv = deleteGhostMatrix(&gmat);
 ((rv == 0) ? (void) (0) : __assert_fail ("rv == 0", "test_mpi_ghost_matrix.c", 71, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 72, __PRETTY_FUNCTION__));
 printf("Ghost row on the top of a 2,2 gmatrix\n");
 gmat = newGhostMatrixRowPanel(2, 2, 1, 0);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 75, __PRETTY_FUNCTION__));
 rv = printGhostMatrix(gmat);
  ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 77, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 79, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 80, __PRETTY_FUNCTION__));
 printf("Ghost row on the bottom of a 3,3 gmatrix\n");
 gmat = newGhostMatrixRowPanel(3, 3, 0, 1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 83, __PRETTY_FUNCTION__));
 rv = printGhostMatrix(gmat);
 ((rv == 0) ? (void) (0) : __assert_fail ("rv == 0", "test_mpi_ghost_matrix.c", 85, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 87, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 88, __PRETTY_FUNCTION__));
 printf("Ghost row above and below a 2,2 gmatrix\n");
 gmat = newGhostMatrixRowPanel(2, 2, 1, 1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 91, __PRETTY_FUNCTION__));
 rv = printGhostMatrix(gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 93, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 95, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 96, __PRETTY_FUNCTION__));
 }

 printf("Testing newGhostMatrixCheckerboard\n");
 {
 ghost_matrix * checker = newGhostMatrixCheckerboard(0,4,0,0,0,0);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 102, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,0,0,0,0,0);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 104, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,4,-1,0,0,0);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 106, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,4,0,-1,0,0);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 108, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,4,0,0,-1,0);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 110, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,4,0,0,0,-1);
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 112, __PRETTY_FUNCTION__));
 checker = newGhostMatrixCheckerboard(3,4,0,0,0,0);
 ((checker!=((void *)0)) ? (void) (0) : __assert_fail ("checker!=((void *)0)", "test_mpi_ghost_matrix.c", 114, __PRETTY_FUNCTION__));
 int rv = printGhostMatrix(checker);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 116, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&checker);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 118, __PRETTY_FUNCTION__));
 ((checker==((void *)0)) ? (void) (0) : __assert_fail ("checker==((void *)0)", "test_mpi_ghost_matrix.c", 119, __PRETTY_FUNCTION__));
 }

 printf("Testing: printCompGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrix(3,3);
 int rv = printCompGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 126, __PRETTY_FUNCTION__));
 rv = printCompGhostMatrix(gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 128, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 130, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 131, __PRETTY_FUNCTION__));
 }


 printf("Testing: setElemGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 138, __PRETTY_FUNCTION__));
 printCompGhostMatrix(gmat);
 int rv = setElemGhostMatrix(((void *)0),0,0,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 141, __PRETTY_FUNCTION__));
 rv = setElemGhostMatrix(gmat, -1,0,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 143, __PRETTY_FUNCTION__));
 rv = setElemGhostMatrix(gmat, 0,-1,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 145, __PRETTY_FUNCTION__));
 rv = setElemGhostMatrix(gmat, 0, 0,2.0);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 147, __PRETTY_FUNCTION__));
 printCompGhostMatrix(gmat);
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 150, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 151, __PRETTY_FUNCTION__));
 }

 printf("Testing: setAllGhostMatrix");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 157, __PRETTY_FUNCTION__));
 printGhostMatrix(gmat);
 int rv = setAllGhostMatrix(((void *)0),3.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 160, __PRETTY_FUNCTION__));
 printGhostMatrix(gmat);
 rv = setAllGhostMatrix(gmat,3.5);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 163, __PRETTY_FUNCTION__));
 printCompGhostMatrix(gmat);
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 166, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 167, __PRETTY_FUNCTION__));
 }

 printf("Testing: setElemCoreGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixRowPanel(3, 2, 1, 1);
 ((gmat!=((void *)0)) ? (void) (0) : __assert_fail ("gmat!=((void *)0)", "test_mpi_ghost_matrix.c", 173, __PRETTY_FUNCTION__));
 printCompGhostMatrix(gmat);
 int rv = setElemCoreGhostMatrix(((void *)0),0,0,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 176, __PRETTY_FUNCTION__));
 rv = setElemCoreGhostMatrix(gmat, -1,0,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 178, __PRETTY_FUNCTION__));
 rv = setElemCoreGhostMatrix(gmat, 0,-1,2.0);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 180, __PRETTY_FUNCTION__));
 rv = setElemCoreGhostMatrix(gmat, 0, 0,2.0);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 182, __PRETTY_FUNCTION__));
 printCompGhostMatrix(gmat);
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 185, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 186, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowStartGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getRowStartGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 193, __PRETTY_FUNCTION__));
 rv = getRowStartGhostMatrix(gmat);
 ((rv==1) ? (void) (0) : __assert_fail ("rv==1", "test_mpi_ghost_matrix.c", 195, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 197, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 198, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowEndGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getRowEndGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 205, __PRETTY_FUNCTION__));
 rv = getRowEndGhostMatrix(gmat);
 ((rv==4) ? (void) (0) : __assert_fail ("rv==4", "test_mpi_ghost_matrix.c", 207, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 209, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 210, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowsGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getRowsGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 217, __PRETTY_FUNCTION__));
 rv = getRowsGhostMatrix(gmat);
 ((rv==5) ? (void) (0) : __assert_fail ("rv==5", "test_mpi_ghost_matrix.c", 219, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 221, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 222, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColStartGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getColStartGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 229, __PRETTY_FUNCTION__));
 rv = getColStartGhostMatrix(gmat);
 ((rv==1) ? (void) (0) : __assert_fail ("rv==1", "test_mpi_ghost_matrix.c", 231, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 233, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 234, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColEndGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getColEndGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 241, __PRETTY_FUNCTION__));
 rv = getColEndGhostMatrix(gmat);
 ((rv==5) ? (void) (0) : __assert_fail ("rv==5", "test_mpi_ghost_matrix.c", 243, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 245, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 246, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColsGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getColsGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 253, __PRETTY_FUNCTION__));
 rv = getColsGhostMatrix(gmat);
 ((rv==6) ? (void) (0) : __assert_fail ("rv==6", "test_mpi_ghost_matrix.c", 255, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 257, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 258, __PRETTY_FUNCTION__));
 }

 printf("Testing: getTotalGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getTotalGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 265, __PRETTY_FUNCTION__));
 rv = getTotalGhostMatrix(gmat);
 ((rv==30) ? (void) (0) : __assert_fail ("rv==30", "test_mpi_ghost_matrix.c", 267, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 269, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 270, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowsCoreGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getRowsCoreGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 277, __PRETTY_FUNCTION__));
 rv = getRowsCoreGhostMatrix(gmat);
 ((rv==3) ? (void) (0) : __assert_fail ("rv==3", "test_mpi_ghost_matrix.c", 279, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 281, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 282, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColsCoreGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getColsCoreGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 289, __PRETTY_FUNCTION__));
 rv = getColsCoreGhostMatrix(gmat);
 ((rv==4) ? (void) (0) : __assert_fail ("rv==4", "test_mpi_ghost_matrix.c", 291, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 293, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 294, __PRETTY_FUNCTION__));
 }

 printf("Testing: getTotalCoreGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(3,4,1,1,1,1);
 int rv = getTotalCoreGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 301, __PRETTY_FUNCTION__));
 rv = getTotalCoreGhostMatrix(gmat);
 ((rv==12) ? (void) (0) : __assert_fail ("rv==12", "test_mpi_ghost_matrix.c", 303, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 305, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 306, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColsWestGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
 int rv = getColsWestGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 313, __PRETTY_FUNCTION__));
 rv = getColsWestGhostMatrix(gmat);
 ((rv==4) ? (void) (0) : __assert_fail ("rv==4", "test_mpi_ghost_matrix.c", 315, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 317, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 318, __PRETTY_FUNCTION__));
 }

 printf("Testing: getColsEastGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
 int rv = getColsEastGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 325, __PRETTY_FUNCTION__));
 rv = getColsEastGhostMatrix(gmat);
 ((rv==3) ? (void) (0) : __assert_fail ("rv==3", "test_mpi_ghost_matrix.c", 327, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 329, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 330, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowsSouthGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
 int rv = getRowsSouthGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 337, __PRETTY_FUNCTION__));
 rv = getRowsSouthGhostMatrix(gmat);
 ((rv==2) ? (void) (0) : __assert_fail ("rv==2", "test_mpi_ghost_matrix.c", 339, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 341, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 342, __PRETTY_FUNCTION__));
 }

 printf("Testing: getRowsNorthGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
 int rv = getRowsNorthGhostMatrix(((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 349, __PRETTY_FUNCTION__));
 rv = getRowsNorthGhostMatrix(gmat);
 ((rv==1) ? (void) (0) : __assert_fail ("rv==1", "test_mpi_ghost_matrix.c", 351, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 353, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 354, __PRETTY_FUNCTION__));
 }

 printf("Testing: getElemGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrix(3,2);
 float rvf = getElemGhostMatrix(((void *)0),1,1);
 ((rvf==-1.0) ? (void) (0) : __assert_fail ("rvf==-1.0", "test_mpi_ghost_matrix.c", 361, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,-1,0);
 ((rvf==-1.0) ? (void) (0) : __assert_fail ("rvf==-1.0", "test_mpi_ghost_matrix.c", 363, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,0,-1);
 ((rvf==-1.0) ? (void) (0) : __assert_fail ("rvf==-1.0", "test_mpi_ghost_matrix.c", 365, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,3,0);
 ((rvf==-1.0) ? (void) (0) : __assert_fail ("rvf==-1.0", "test_mpi_ghost_matrix.c", 367, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,0,2);
 ((rvf==-1.0) ? (void) (0) : __assert_fail ("rvf==-1.0", "test_mpi_ghost_matrix.c", 369, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,2,1);
 ((rvf==0.0) ? (void) (0) : __assert_fail ("rvf==0.0", "test_mpi_ghost_matrix.c", 371, __PRETTY_FUNCTION__));
 rvf = getElemGhostMatrix(gmat,0,0);
 ((rvf==0.0) ? (void) (0) : __assert_fail ("rvf==0.0", "test_mpi_ghost_matrix.c", 373, __PRETTY_FUNCTION__));
 int rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 375, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 376, __PRETTY_FUNCTION__));
 }

 printf("Testing: copyGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrix(3,4);
 int rv = setAllGhostMatrix(gmat,1.1);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 383, __PRETTY_FUNCTION__));
 for(int r=0;r<3;r++){
   for(int c=0;c<4;c++){
    float rvf = getElemGhostMatrix(gmat,r,c);
    float temp = 1.1;
    ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 388, __PRETTY_FUNCTION__));
   }
 }
 ghost_matrix * gmat2 = newGhostMatrix(3,4);
 rv = copyGhostMatrix(0,2,0,3,gmat,gmat2);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 393, __PRETTY_FUNCTION__));
 for(int r=0;r<3;r++){
   for(int c=0;c<4;c++){
    float rvf = getElemGhostMatrix(gmat2,r,c);
    float temp = 1.1;
    ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 398, __PRETTY_FUNCTION__));
   }
 }
 rv = copyGhostMatrix(-1,2,0,3,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 402, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(2,1,0,3,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 404, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,3,0,3,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 406, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,2,-1,3,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 408, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,2,0,4,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 410, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,2,2,1,gmat,gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 412, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,2,0,3,((void *)0),gmat2);
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 414, __PRETTY_FUNCTION__));
 rv = copyGhostMatrix(0,2,0,3,gmat,((void *)0));
 ((rv==-1) ? (void) (0) : __assert_fail ("rv==-1", "test_mpi_ghost_matrix.c", 416, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 418, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 419, __PRETTY_FUNCTION__));
 rv = deleteGhostMatrix(&gmat2);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 421, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 422, __PRETTY_FUNCTION__));
 }

 printf("Testing: getElemCoreGhostMatrix\n");
 {
 ghost_matrix * gmat = newGhostMatrixCheckerboard(5,5,1,2,3,4);
 float rvf = getElemCoreGhostMatrix(gmat, 0, 0);
 float temp = 0.0;
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 430, __PRETTY_FUNCTION__));
 rvf = getElemCoreGhostMatrix(gmat, 4, 4);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 432, __PRETTY_FUNCTION__));
 temp = -1.0;
 rvf = getElemCoreGhostMatrix(((void *)0), 0, 0);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 435, __PRETTY_FUNCTION__));
 rvf = getElemCoreGhostMatrix(gmat, -1, 0);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 437, __PRETTY_FUNCTION__));
 rvf = getElemCoreGhostMatrix(gmat, 5, 0);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 439, __PRETTY_FUNCTION__));
 rvf = getElemCoreGhostMatrix(gmat, 0, -1);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 441, __PRETTY_FUNCTION__));
 rvf = getElemCoreGhostMatrix(gmat, 0, 5);
 ((rvf==temp) ? (void) (0) : __assert_fail ("rvf==temp", "test_mpi_ghost_matrix.c", 443, __PRETTY_FUNCTION__));
 int rv = deleteGhostMatrix(&gmat);
 ((rv==0) ? (void) (0) : __assert_fail ("rv==0", "test_mpi_ghost_matrix.c", 445, __PRETTY_FUNCTION__));
 ((gmat==((void *)0)) ? (void) (0) : __assert_fail ("gmat==((void *)0)", "test_mpi_ghost_matrix.c", 446, __PRETTY_FUNCTION__));
 }
# 611 "test_mpi_ghost_matrix.c"
 return 0;
}
