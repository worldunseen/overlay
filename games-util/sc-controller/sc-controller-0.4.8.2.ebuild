# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
DISTUTILS_USE_SETUPTOOLS=no

inherit desktop distutils-r1 xdg-utils

DESCRIPTION="A user-mode driver, mapper, and GUI for Steam controllers and others"
HOMEPAGE="https://github.com/Ryochan7/sc-controller"
SRC_URI="https://github.com/Ryochan7/sc-controller/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"

RDEPEND="
	=x11-libs/gtk+-3*
	dev-python/pylibacl[${PYTHON_USEDEP}]
	dev-python/python-evdev[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_install_all() {
	doicon -s scalable images/${PN}.svg
	domenu scripts/${PN}.desktop

	distutils-r1_python_install_all
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
