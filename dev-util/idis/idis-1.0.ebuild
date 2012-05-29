# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="An Interactive DISassembler."
HOMEPAGE="http://idis.krakonos.org/"
SRC_URI="http://idis.krakonos.org/downloads/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/libyaml 
	>=dev-lang/swig-2.0.4
	>=dev-lang/python-3.0"
RDEPEND="${DEPEND}"

src_compile() {
	cd src
	make PREFIX=/usr
}

src_install() {
	cd src
	make PREFIX=${D}/usr install
}

