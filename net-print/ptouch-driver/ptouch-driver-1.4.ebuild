# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="CUPS/Foomatic driver for Brother P-touch label printer"
HOMEPAGE="https://bitbucket.org/philpem/printer-driver-ptouch/overview"
SRC_URI="https://bitbucket.org/philpem/printer-driver-ptouch/get/1.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-print/foomatic-db"
RDEPEND="${DEPEND}"

S="${WORKDIR}/philpem-printer-driver-ptouch-b34d343546fb"

src_configure() {
	eautoreconf
	econf --libdir=/usr/libexec
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	#/usr/libexec/cups/filter/

	dodoc AUTHORS ChangeLog NEWS README
}
