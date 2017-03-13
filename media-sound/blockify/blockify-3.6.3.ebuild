# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python3_5 )

inherit distutils-r1

DESCRIPTION="Mutes Spotify advertisements"
HOMEPAGE="https://github.com/mikar/blockify"
RESTRICT="primaryuri"
SRC_URI="https://github.com/mikar/blockify/archive/v${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python"

RDEPEND="dev-python/dbus-python
         dev-python/docopt
         dev-python/gst-python
         dev-python/pygtk
         dev-python/setuptools
         media-libs/alsa-oss
         media-sound/pulseaudio
         media-sound/spotify"
DEPEND="${RDEPEND}"

python_compile_all () {
  distutils-r1_python_compile_all
}

python_install_all() {
	distutils-r1_python_install_all
}
