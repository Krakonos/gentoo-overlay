# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A set of automation tools for geocaching.com and others."
HOMEPAGE="http://geo.rkkda.com"
SRC_URI="http://geo.rkkda.com/${P//./-}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-calculators/units
		app-arch/sharutils"
RDEPEND="${DEPEND}"

S="${WORKDIR}/geo"

src_install() {
	mkdir "${D}/usr"
	emake PREFIX="${D}/usr" install || die "emake failed"
}
