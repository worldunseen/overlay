# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit desktop distutils-r1 git-r3 xdg-utils

DESCRIPTION="A free, open source stenography engine"
HOMEPAGE="https://www.openstenoproject.org/plover/"
EGIT_REPO_URI="https://github.com/openstenoproject/plover.git"
EGIT_COMMIT="d20167f4da549376af7d978dec5c17b1c4f94d89"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/python-xlib[${PYTHON_USEDEP}]
	dev-python/wcwidth[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_install_all() {
	doicon -s scalable ${PN}/assets/${PN}-icon.svg
	domenu application/${PN}.desktop

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
