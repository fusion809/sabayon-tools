# Copyright 2015-2016 Brenton Horne <brentonhorne77@gmail.com>
# DESCRIPTION and the configure.local section was taken from
# http://pkgbuild.com/git/aur-mirror.git/tree/mdocml/PKGBUILD

EAPI=5
DESCRIPTION="mandoc is a suite of tools compiling mdoc, the roff macro language and man manuals."
HOMEPAGE="http://mdocml.bsd.lv/"
RESTRICT="mirror"
LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://mdocml.bsd.lv/snapshots/${PN}-${PV}.tar.gz -> ${PV}.tar.gz"
DEPEND="dev-db/sqlite"
RDEPEND="${DEPEND}
        !sys-apps/man-db"

src_configure() {
  cat << END > "configure.local"
PREFIX="/usr"
SBINDIR="/usr/bin"
MANDIR="/usr/share/man"
EXAMPLEDIR="/usr/share/mandoc/examples"
BINM_MAN="mman"
BINM_APROPOS="mapropos"
BINM_WHATIS="mwhatis"
MANM_MAN="mandoc_man"
MANM_MDOC="mandoc_mdoc"
MANM_ROFF="mandoc_roff"
# default cflags
$(grep -m1 'CFLAGS=' configure)
# add our cflags
CFLAGS="${CFLAGS} $CFLAGS"
END
  ./configure
}

src_compile() {
  emake
}

src_install() {
  emake -j1 DESTDIR=${D} install
  install -Dm644 LICENSE ${D}/usr/share/licenses/${PN}/LICENSE
}
