# ===========================================================================
#    http://www.nongnu.org/autoconf-archive/ac_cxx_dtor_after_atexit.html
# ===========================================================================
#
# SYNOPSIS
#
#   AC_CXX_DTOR_AFTER_ATEXIT
#
# DESCRIPTION
#
#   If the C++ compiler calls global destructors after atexit functions,
#   define HAVE_DTOR_AFTER_ATEXIT. WARNING: If cross-compiling, the test
#   cannot be performed, the default action is to define
#   HAVE_DTOR_AFTER_ATEXIT.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved.

AC_DEFUN([AC_CXX_DTOR_AFTER_ATEXIT],
[AC_CACHE_CHECK(whether the compiler calls global destructors after functions registered through atexit,
ac_cv_cxx_dtor_after_atexit,
[AC_LANG_SAVE
 AC_LANG_CPLUSPLUS
 AC_TRY_RUN([
#include <unistd.h>
#include <stdlib.h>

static int dtor_called = 0;
class A { public : ~A () { dtor_called = 1; } };
static A a;

void f() { _exit(dtor_called); }

int main (int , char **)
{
  atexit (f);
  return 0;
}
],
 ac_cv_cxx_dtor_after_atexit=yes, ac_cv_cxx_dtor_after_atexit=yes=no,
 ac_cv_cxx_dtor_after_atexit=yes)
 AC_LANG_RESTORE
])
if test "$ac_cv_cxx_dtor_after_atexit" = yes; then
  AC_DEFINE(HAVE_DTOR_AFTER_ATEXIT,,
            [define if the compiler calls global destructors after functions registered through atexit])
fi
])
