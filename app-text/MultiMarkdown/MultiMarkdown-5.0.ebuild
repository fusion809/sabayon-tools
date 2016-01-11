# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $id$

EAPI=2

inherit eutils vcs-snapshot git-2

DESCRIPTION="MMD is a superset of the Markdown syntax (more syntax features & output formats)"
HOMEPAGE="http://fletcher.github.io/MultiMarkdown-5/"
EGIT_REPO_URI="git://github.com/fletcher/${PN}.git"
EGIT_COMMIT="v${PV}"
LICENSE="|| ( GPL-2 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="
doc? (
		app-doc/doxygen
)"

src_install() {
	insinto ${DEST_DIR_EXE}
	einfo "Installing multimarkdown binary to ${DEST_DIR_EXE}/multimarkdown ..."
	dobin multimarkdown || die "Install failed"

	if use shortcuts ; then
		einfo "Installing shortcuts for ${PN}"
		exeinto ${DEST_DIR_EXE}
		for file in ${SHORTCUTS_LIST}; do
			# einfo "Installing ${file} to ${DEST_DIR_EXE}/${file} ..."
			doexe scripts/${file} || die "Installation of script ${file} failed!"
		done
	fi
}
