# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/eric/eric-5.5.2.ebuild,v 1.3 2015/03/01 16:35:19 pesa Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )
PYTHON_REQ_USE="sqlite,xml"
PLOCALES="cs de en es fr it pt ru tr zh_CN"

inherit eutils l10n python-single-r1 versionator

DESCRIPTION="A full featured Python IDE using PyQt4 and QScintilla"
HOMEPAGE="http://eric-ide.python-projects.org/"

SLOT=$(get_major_version)
MY_PV=${PV/_rc/-RC}
MY_P=${PN}${SLOT}-${MY_PV}

BASE_URI="mirror://sourceforge/eric-ide/${PN}${SLOT}/stable/${MY_PV}"
RESTRICT="primaryuri"
SRC_URI="${BASE_URI}/${MY_P}.tar.gz"
for L in ${PLOCALES}; do
	SRC_URI+=" linguas_${L}? ( ${BASE_URI}/${PN}${SLOT}-i18n-${L/zh_CN/zh_CN.GB2312}-${MY_PV}.tar.gz )"
done
unset L

LICENSE="GPL-3"
KEYWORDS="amd64 ~ppc ~ppc64 x86"
IUSE=""

DEPEND="
	${PYTHON_DEPS}
        >=dev-python/PyQt4-4.10.0[${PYTHON_USEDEP},help,sql,svg,webkit]
	>=dev-python/qscintilla-python-2.8.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	>=dev-python/chardet-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/coverage-3.7.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	# Avoid file collisions between different slots of Eric
	sed -i -e 's/^Icon=eric$/&${SLOT}/' eric/eric${SLOT}.desktop || die
	sed -i -e 's/\([^[:alnum:]]\)eric\.png\([^[:alnum:]]\)/\1eric'${SLOT}'.png\2/' \
		$(grep -lr 'eric\.png' .) || die

	mv eric/icons/default/eric{,${SLOT}}.png || die
	mv eric/pixmaps/eric{,${SLOT}}.png || die
	rm -f eric/APIs/Python/zope-*.api
	rm -f eric/APIs/Ruby/Ruby-*.api

	# Delete internal copies of dev-python/chardet and dev-python/pygments
	rm -fr eric/ThirdParty

	# Delete internal copy of dev-python/coverage
	rm -fr eric/DebugClients/Python{,3}/coverage
	sed -i -e 's/from DebugClients\.Python3\?\.coverage/from coverage/' \
		$(grep -lr 'from DebugClients\.Python3\?\.coverage' .) || die

	# Fix desktop files (bug 458092)
	sed -i -e '/^Categories=/s:Python:X-&:' eric/eric${SLOT}{,_webbrowser}.desktop || die
}

src_install() {
	"${PYTHON}" install.py \
		-b "${EPREFIX}/usr/bin" \
		-d "$(python_get_sitedir)" \
		-i "${D}" \
		-c \
		-z \
		|| die

	python_optimize

	doicon "eric/icons/default/eric"${SLOT}".png"
	dodoc changelog THANKS
}

pkg_postinst() {
	elog "The following packages will give Eric extended functionality:"
	elog "  dev-python/cx_Freeze"
	elog "  dev-python/pyenchant"
	elog "  dev-python/pylint"
	elog "  dev-python/pysvn"
	elog "  dev-vcs/mercurial"
	elog
	elog "This version has a plugin interface with plugin-autofetch from"
	elog "the application itself. You may want to check that as well."
}
