# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils git-r3

DESCRIPTION="Cross-platform content manager assistant for the PS Vita"
HOMEPAGE="https://github.com/codestation/qcma"
EGIT_REPO_URI="https://github.com/codestation/qcma.git"

LICENSE="GPL-3"
SLOT="0"

IUSE="+ffmpeg"

DEPEND="
	dev-libs/glib:2
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	media-libs/vitamtp:0
	ffmpeg? ( media-video/ffmpeg:0 )
	x11-libs/libnotify:0
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-qt/linguist-tools
"

src_prepare() {
	rm ChangeLog || die "Failed to rm changelog" # Triggers QA warn (symlink to nowhere)
	default
}

src_configure() {
	lrelease common/resources/translations/*.ts
	eqmake5 PREFIX="${D}"/usr qcma.pro CONFIG+="QT5_SUFFIX" $(usex ffmpeg "" CONFIG+="DISABLE_FFMPEG")
}
