# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="Graphical user interface of app-emulation/firejail"
HOMEPAGE="https://l3net.wordpress.com/projects/firejail"
EGIT_REPO_URI="https://github.com/netblue30/firetools"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	|| (
		sys-apps/firejail
		sys-apps/firejail-lts
	)
	dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-qt/qtsvg:5=
	x11-terms/xterm
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
