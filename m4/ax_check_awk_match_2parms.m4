# ==============================================================================
#  https://www.gnu.org/software/autoconf-archive/ax_check_awk_match_2parms.html
# ==============================================================================
#
# SYNOPSIS
#
#   AX_CHECK_AWK_MATCH_2PARMS([ACTION-IF-SUCCESS],[ACTION-IF-FAILURE])
#
# DESCRIPTION
#
#   Check if AWK supports match() function with 2 parameters (standard). If
#   successful execute ACTION-IF-SUCCESS otherwise ACTION-IF-FAILURE.
#
#   This work is heavily based upon testawk.sh script by Heiner Steven. You
#   should find his script (and related works) at
#   <http://www.shelldorado.com/articles/awkcompat.html>. Thanks to
#   Alessandro Massignan for his suggestions and extensive nawk tests on
#   FreeBSD.
#
# LICENSE
#
#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 9

AC_DEFUN([AX_CHECK_AWK_MATCH_2PARMS], [
  AX_TRY_AWK_EXPOUT([match() with 2 parameters],
    [],[ print match("ab", /b/) ],[2],
    [$1],[$2])
])
