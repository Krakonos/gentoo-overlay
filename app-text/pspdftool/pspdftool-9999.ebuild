# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Tool for prepress preparation of PDF and PostScript documents."
ESVN_REPO_URI="https://pspdftool.svn.sourceforge.net/svnroot/pspdftool/trunk"
ESVN_PROJECT="pspdftool"
HOMEPAGE="http://sourceforge.net/projects/pspdftool"

LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE="zlib debug"

inherit subversion

DEPEND="sys-apps/sed
		app-text/ghostscript-gpl
		zlib? ( sys-libs/zlib )"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	myconf="--without-zlib"
	use zlib && myconf="--with-zlib"
	use debug && myconf="${myconf} --debug"
	./autogen.sh
	./configure $myconf || die "Configuration error!"
	emake || die "Compilation error!"
}

src_install () {
	einstall || die "Instalation error!"
}
