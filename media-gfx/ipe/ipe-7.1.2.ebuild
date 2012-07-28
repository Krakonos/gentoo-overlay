# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A drawing editor for creating figures in PDF or (encapsulated) Postscript format."
HOMEPAGE="http://ipe7.sourceforge.net/"
SRC_URI="mirror://sourceforge/ipe7/${P}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
true
}

src_compile() {
	cd src
	emake IPEPREFIX=/usr MOC=moc IPE_USE_ICONV=-DIPE_USE_ICONV || die
}

src_install() {
	cd src
	emake IPEPREFIX="${D}/usr" install || die
}
