dnl Process this file with autoconf to produce a configure script. -*-m4-*-

AC_INIT(libspeex/speex.c)

AM_CONFIG_HEADER([config.h])

SPEEX_MAJOR_VERSION=1
SPEEX_MINOR_VERSION=1
SPEEX_MICRO_VERSION=15
SPEEX_EXTRA_VERSION=
#SPEEX_VERSION=
#SPEEX_VERSION=$SPEEX_MAJOR_VERSION.$SPEEX_MINOR_VERSION.$SPEEX_MICRO_VERSION$SPEEX_EXTRA_VERSION
SPEEX_VERSION="1.2beta3"

SPEEX_LT_CURRENT=5
SPEEX_LT_REVISION=0
SPEEX_LT_AGE=4

AC_SUBST(SPEEX_LT_CURRENT)
AC_SUBST(SPEEX_LT_REVISION)
AC_SUBST(SPEEX_LT_AGE)

# For automake.
VERSION=$SPEEX_VERSION
PACKAGE=speex

AC_SUBST(SPEEX_VERSION)

AM_INIT_AUTOMAKE($PACKAGE, $VERSION, no-define)
AM_MAINTAINER_MODE

AC_CANONICAL_HOST
AC_LIBTOOL_WIN32_DLL
AM_PROG_LIBTOOL

AC_C_BIGENDIAN
AC_C_CONST
AC_C_INLINE
AC_C_RESTRICT


AC_MSG_CHECKING(for C99 variable-size arrays)
AC_TRY_COMPILE( , [
int foo;
foo = 10;
int array[foo];
],
[has_var_arrays=yes;AC_DEFINE([VAR_ARRAYS], [], [Use C99 variable-size arrays])
],
has_var_arrays=no
)
AC_MSG_RESULT($has_var_arrays)

AC_CHECK_HEADERS([alloca.h getopt.h])
AC_MSG_CHECKING(for alloca)
AC_TRY_COMPILE( [
#ifdef HAVE_ALLOCA_H
# include <alloca.h>
#endif
#include <stdlib.h>
], [
int foo=10;
int *array = alloca(foo);
],
[
has_alloca=yes;
if test x$has_var_arrays = "xno" ; then
AC_DEFINE([USE_ALLOCA], [], [Make use of alloca])
fi
],
has_alloca=no
)
AC_MSG_RESULT($has_alloca)


AC_CHECK_HEADERS(sys/soundcard.h sys/audioio.h)

XIPH_PATH_OGG([src="src"], [src=""])
AC_SUBST(src)

AC_CHECK_LIB(m, sin)

# Check for getopt_long; if not found, use included source.
AC_CHECK_FUNCS([getopt_long],,
[# FreeBSD has a gnugetopt library.
  AC_CHECK_LIB([gnugetopt],[getopt_long],
[AC_DEFINE([HAVE_GETOPT_LONG])],
[# Use the GNU replacement.
AC_LIBOBJ(getopt)
AC_LIBOBJ(getopt1)])])

AC_CHECK_LIB(winmm, main)

AC_DEFINE_UNQUOTED(SPEEX_VERSION, "${SPEEX_VERSION}", [Complete version string])
AC_DEFINE_UNQUOTED(SPEEX_MAJOR_VERSION, ${SPEEX_MAJOR_VERSION}, [Version major])
AC_DEFINE_UNQUOTED(SPEEX_MINOR_VERSION, ${SPEEX_MINOR_VERSION}, [Version minor])
AC_DEFINE_UNQUOTED(SPEEX_MICRO_VERSION, ${SPEEX_MICRO_VERSION}, [Version micro])
AC_DEFINE_UNQUOTED(SPEEX_EXTRA_VERSION, "${SPEEX_EXTRA_VERSION}", [Version extra])

AC_ARG_ENABLE(valgrind, [  --enable-valgrind       Enable valgrind extra checks],
[if test "$enableval" = yes; then
  AC_DEFINE([ENABLE_VALGRIND], , [Enable valgrind extra checks])
fi])

AC_ARG_ENABLE(sse, [  --enable-sse            Enable SSE support], [if test "$enableval" = yes; then
AC_DEFINE([_USE_SSE], , [Enable SSE support])
CFLAGS="$CFLAGS -O3 -msse"
fi
])

AC_ARG_ENABLE(fixed-point, [  --enable-fixed-point    Compile as fixed-point],
[if test "$enableval" = yes; then
  AC_DEFINE([FIXED_POINT], , [Compile as fixed-point])
else
  AC_DEFINE([FLOATING_POINT], , [Compile as floating-point])
fi],
AC_DEFINE([FLOATING_POINT], , [Compile as floating-point]))

AC_ARG_ENABLE(float-api, [  --disable-float-api     Disable the floating-point API],
[if test "$enableval" = no; then
  AC_DEFINE([DISABLE_FLOAT_API], , [Disable all parts of the API that are using floats])
fi])

AC_ARG_ENABLE(vbr, [  --disable-vbr           Disable VBR and VAD from the codec],
[if test "$enableval" = no; then
  AC_DEFINE([DISABLE_VBR], , [Disable VBR and VAD from the codec])
fi])

AC_ARG_ENABLE(arm4-asm, [  --enable-arm4-asm       Make use of ARM4 assembly optimizations],
[if test "$enableval" = yes; then
  AC_DEFINE([ARM4_ASM], , [Make use of ARM4 assembly optimizations])
fi])

AC_ARG_ENABLE(arm5e-asm, [  --enable-arm5e-asm      Make use of ARM5E assembly optimizations],
[if test "$enableval" = yes; then
  AC_DEFINE([ARM5E_ASM], , [Make use of ARM5E assembly optimizations])
fi])

AC_ARG_ENABLE(blackfin-asm, [  --enable-blackfin-asm   Make use of Blackfin assembly optimizations],
[if test "$enableval" = yes; then
  AC_DEFINE([BFIN_ASM], , [Make use of Blackfin assembly optimizations])
  case $host_os in
    uclinux) LDFLAGS="$LDFLAGS -Wl,-elf2flt=-s100000";;
  esac
fi])

AC_ARG_ENABLE(fixed-point-debug, [  --enable-fixed-point-debug  Debug fixed-point implementation],
[if test "$enableval" = yes; then
  AC_DEFINE([FIXED_DEBUG], , [Debug fixed-point implementation])
fi])

AC_ARG_ENABLE(ti-c55x, [  --enable-ti-c55x        Enable support for TI C55X DSP],
[if test "$enableval" = yes; then
  has_char16=yes;
  AC_DEFINE([TI_C55X], , [Enable support for TI C55X DSP])
fi])

AC_CHECK_SIZEOF(short)
AC_CHECK_SIZEOF(int)
AC_CHECK_SIZEOF(long)

if test x$has_char16 = "xyes" ; then
        case 1 in
                $ac_cv_sizeof_short) SIZE16="short";;
                $ac_cv_sizeof_int) SIZE16="int";;
        esac
else
        case 2 in
                $ac_cv_sizeof_short) SIZE16="short";;
                $ac_cv_sizeof_int) SIZE16="int";;
        esac
fi

if test x$has_char16 = "xyes" ; then
        case 2 in
                $ac_cv_sizeof_int) SIZE32="int";;
                $ac_cv_sizeof_long) SIZE32="long";;
                $ac_cv_sizeof_short) SIZE32="short";;
        esac
else
        case 4 in
                $ac_cv_sizeof_int) SIZE32="int";;
                $ac_cv_sizeof_long) SIZE32="long";;
                $ac_cv_sizeof_short) SIZE32="short";;
        esac
fi

AC_SUBST(SIZE16)
AC_SUBST(SIZE32)

AC_OUTPUT([Makefile libspeex/Makefile src/Makefile doc/Makefile Speex.spec
           include/Makefile include/speex/Makefile speex.pc speexdsp.pc
           win32/Makefile win32/libspeex/Makefile win32/speexenc/Makefile
           win32/speexdec/Makefile symbian/Makefile 
           win32/VS2003/Makefile
           win32/VS2003/tests/Makefile
           win32/VS2003/libspeex/Makefile
           win32/VS2003/libspeexdsp/Makefile
           win32/VS2003/speexdec/Makefile
           win32/VS2003/speexenc/Makefile
           win32/VS2005/Makefile
           win32/VS2005/libspeex/Makefile
           win32/VS2005/speexdec/Makefile
           win32/VS2005/speexenc/Makefile
           win32/VS2005/libspeexdsp/Makefile
           win32/VS2005/tests/Makefile
           win32/VS2008/libspeexdsp/Makefile
           win32/VS2008/Makefile
           win32/VS2008/speexdec/Makefile
           win32/VS2008/tests/Makefile
           win32/VS2008/libspeex/Makefile
           win32/VS2008/speexenc/Makefile
           include/speex/speex_config_types.h ti/Makefile 
	   ti/speex_C54_test/Makefile ti/speex_C55_test/Makefile
	   ti/speex_C64_test/Makefile ])

if test "x$src" = "x"; then 
echo "**IMPORTANT**"
echo "You don't seem to have the development package for libogg (libogg-devel) installed. Only the Speex library (libspeex) will be built (no encoder/decoder executable)"
echo "You can download libogg from http://downloads.xiph.org/releases/ogg/"
fi

echo "Type \"make; make install\" to compile and install Speex";
