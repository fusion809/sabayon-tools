# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils eutils games

DESCRIPTION="Classic 2D jump'n run sidescroller game in a style similar to the original Super Mario Bros."
HOMEPAGE="http://supertuxproject.org"
EGIT_REPO_URI="https://github.com/SuperTux/supertux"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="opengl curl debug"

RDEPEND="dev-games/physfs
	dev-libs/boost
	media-libs/glew
	media-libs/libsdl2[joystick,static-libs]
	media-libs/sdl2-image[png,jpeg]
	media-libs/libvorbis
	media-libs/openal
	x11-libs/libXt
	curl? ( net-misc/curl )
	opengl? ( virtual/opengl )"
DEPEND="${RDEPEND}"

DOCS="NEWS.md README.md docs/levelguidelines.txt data/credits.txt"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	sed -e "/Icon=/s/supertux.png/supertux2/" \
		-i supertux2.desktop || die
}

src_configure() {
	local mycmakeargs="-DWERROR=OFF \
			-DINSTALL_SUBDIR_BIN=games/bin \
			-DINSTALL_SUBDIR_DOC=share/doc/${P} \
			$(cmake-utils_use_enable opengl OPENGL) \
			$(cmake-utils_use_enable debug SQDBG) \
			$(cmake-utils_use debug DEBUG)"

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	pushd "${D}/usr/share/pixmaps" &>/dev/null || die
	local ext
	for ext in png xpm ; do
		mv ${PN}{,2}.${ext} || die
	done
	popd &>/dev/null || die

	prepgamesdirs
}
