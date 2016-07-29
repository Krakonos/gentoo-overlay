# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="CUPS/Foomatic driver for Brother P-touch label printer"
HOMEPAGE="http://www.diku.dk/~panic/P-touch/"
SRC_URI="http://www.diku.dk/~panic/P-touch/ptouch-driver-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-print/foomatic-db"
RDEPEND="${DEPEND}"


src_configure() {
	econf --libdir=/usr/libexec
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	#/usr/libexec/cups/filter/

	dodoc AUTHORS ChangeLog NEWS README
}
