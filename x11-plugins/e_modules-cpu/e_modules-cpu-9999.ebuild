# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $id$

EAPI=5

EGIT_SUB_PROJECT="enlightenment/modules"
EGIT_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="CPU monitor module for e17"

DEPEND=">=x11-wm/enlightenment-0.17.0_alpha:0.17=
	dev-libs/efl"
RDEPEND=${DEPEND}
