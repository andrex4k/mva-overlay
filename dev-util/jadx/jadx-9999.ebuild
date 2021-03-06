# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit java-utils-2 git-r3

DESCRIPTION="Android Dex to Java Decompiler"
HOMEPAGE="https://github.com/skylot/jadx"
EGIT_REPO_URI="https://github.com/skylot/${PN}"
EGIT_SUBMODULES=( '*' '-*test*' )

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=virtual/jre-1.6:*
"
DEPEND="
	${RDEPEND}
	virtual/gradle
"

src_compile() {
	gradle --console=plain dist || die 'Failed to build'
}

src_install() {
	cd "${S}/build/${PN}/lib";
	for jar in *.jar; do
		java-pkg_newjar ${jar} ${jar}
	done

	java-pkg_dolauncher ${PN} --main jadx.cli.JadxCLI --java_args "-Xmx512M"
	java-pkg_dolauncher ${PN}-gui --main jadx.gui.JadxGUI --java_args "-Xmx512M"
}
