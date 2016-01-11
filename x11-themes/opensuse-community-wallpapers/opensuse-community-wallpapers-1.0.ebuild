# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit rpm eutils

DESCRIPTION="openSUSE community supplemental wallpapers 43"
HOMEPAGE="https://github.com/openSUSE/artwork"
SRC_URI="http://download.opensuse.org/repositories/home:/warlordfff/openSUSE_Factory/src/community-supplemental-wallpaper-43-1.0-1.4.src.rpm -> ${PN}-${PV}.src.rpm"
RESTRICT="mirror"
LICENSE="CC-BY-SA-3.0"
KEYWORDS="~amd64 ~x86"

SLOT="0"

S="${WORKDIR}/43"

src_unpack() {
  src_unpack
  unpack ./43.tar.xz
}

src_install() {
  insinto /usr/share/wallpapers
  doins *.jpg *.png
}
