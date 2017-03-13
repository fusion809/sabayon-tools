EAPI=6
inherit unpacker eutils

DESCRIPTION="A simple & beautiful app for Facebook Messenger."
HOMEPAGE="https://messengerfordesktop.com/"

SRC_URI_AMD64="https://github.com/aluxian/Messenger-for-Desktop/releases/download/v$PV/messengerfordesktop-${PV}-linux-amd64.deb"
SRC_URI_X86="https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v${PV}/messengerfordesktop-${PV}-linux-i386.deb"
SRC_URI="
        amd64? ( ${SRC_URI_AMD64} )
        x86? ( ${SRC_URI_X86} )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
    unpack_deb ${A}
}

src_install() {
    cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
    cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
    domenu ${WORKDIR}/opt/MessengerForDesktop/messengerfordesktop.desktop
    doicon ${WORKDIR}/usr/share/icons/hicolor/48x48/apps/messengerfordesktop.png

}

