#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME=mate-system-monitor

(test -f $srcdir/configure.in \
  && test -f $srcdir/autogen.sh \
  && test -d $srcdir/src) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

which mate-autogen.sh || {
    echo "You need to install mate-common from the MATE CVS"
    exit 1
}

REQUIRED_AUTOMAKE_VERSION=1.9 MATE_DATADIR="$mate_datadir" USE_COMMON_DOC_BUILD=yes . mate-autogen.sh
