# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit flag-o-matic python-any-r1 eutils unpacker pax-utils

DESCRIPTION="A hackable text editor for the 21st Century - built from official binary package."
HOMEPAGE="https://atom.io"
MY_PN="atom"
SRC_URI="
	amd64? ( https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_PN}-amd64.tar.gz -> ${MY_PN}-amd64-${PV}.tar.gz )
"

RESTRICT="mirror"

KEYWORDS="~amd64"
SLOT="0"
LICENSE="MIT"

IUSE="system-node"

DEPEND="${PYTHON_DEPS}
	media-fonts/inconsolata
	!!dev-util/atom-shell
	!dev-util/apm
	!app-editors/atom"

RDEPEND="${DEPEND}
	x11-libs/gtk+:2
	x11-libs/libnotify
	gnome-base/libgnome-keyring
	dev-libs/nss
	dev-libs/nspr
	gnome-base/gconf
	media-libs/alsa-lib
	net-print/cups
	sys-libs/libcap
	system-node? ( net-libs/nodejs[npm] )
	x11-libs/libXtst
	x11-libs/pango"

QA_PRESTRIPPED="
	/usr/share/${MY_PN}/${MY_PN}
	/usr/share/${MY_PN}/chromedriver/chromedriver
	/usr/share/${MY_PN}/libffmpegsumo.so
	/usr/share/${MY_PN}/libnotify.so.4
	/usr/share/${MY_PN}/libchromiumcontent.so
	/usr/share/${MY_PN}/libgcrypt.so.11
	/usr/share/${MY_PN}/resources/app.asar.unpacked/node_modules/symbols-view/vendor/ctags-linux"

S="${WORKDIR}/${MY_PN}-${PV}-amd64"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_prepare(){
	#If you want to use the system node, we don't need the local one, so we must delete it first
	if use system-node; then
		rm resources/app/apm/bin/node
		rm resources/app/apm/bin/npm
		#Fix apm binary to use the nodejs binary rather than the built-in
		sed -i "s#\$binDir\/\$nodeBin#\$\(which \$nodeBin\)#" resources/app/apm/bin/apm
	fi
	eapply_user
}

src_install() {
	pax-mark m ${MY_PN}
	insinto ${EPREFIX}/usr/share/${MY_PN}
	doins -r .
	doicon ${MY_PN}.png
	insinto ${EPREFIX}/usr/share/doc/${MY_PN}
	newins resources/LICENSE.md copyright
	newbin ${FILESDIR}/${PN} ${MY_PN}
	insinto ${EPREFIX}/usr/share/lintian/overrides
	newins ${FILESDIR}/${MY_PN}-lintian ${MY_PN}
	dosym ${EPREFIX}/usr/share/${MY_PN}/resources/app/apm/bin/apm ${EPREFIX}/usr/bin/apm

	# Fixes permissions
	fperms +x /usr/bin/${MY_PN}
	fperms +x /usr/share/${MY_PN}/${MY_PN}
	fperms +x /usr/share/${MY_PN}/resources/app/${MY_PN}.sh
	if use !system-node; then
		fperms +x /usr/share/${MY_PN}/resources/app/apm/bin/node
		fperms +x /usr/share/${MY_PN}/resources/app/apm/bin/npm
	fi
	fperms +x /usr/share/${MY_PN}/resources/app/apm/bin/apm
	fperms +x /usr/share/${MY_PN}/resources/app/apm/node_modules/npm/bin/node-gyp-bin/node-gyp
	fperms +x /usr/share/${MY_PN}/resources/app.asar.unpacked/node_modules/symbols-view/vendor/ctags-linux
	
	insinto /usr/share/applications
	newins ${FILESDIR}/atom.desktop atom.desktop
}
