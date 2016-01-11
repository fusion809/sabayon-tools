# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Tools for building C and C++ programs. Some of these tools will be required to build programs with Portage, but not listed amongst build dependencies"
LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-arch/bzip2
        <dev-lang/perl-5.22
        sys-devel/autoconf
        sys-devel/autogen
        sys-devel/automake
        sys-devel/base-gcc
        sys-devel/binutils
        sys-devel/bison
        sys-devel/clang
        sys-devel/gcc[cxx]
        sys-devel/gettext
        sys-devel/libtool
        sys-devel/make
        sys-devel/qconf
        sys-libs/libstdc++-v3"
DEPEND=""
