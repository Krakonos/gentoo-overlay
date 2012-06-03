# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A simple around httperf generating nice CSV stats & graphs."
HOMEPAGE="http://www.xenoclast.org/autobench/"
SRC_URI="http://www.xenoclast.org/autobench/downloads/autobench-${PV}.tar.gz"

LICENSE="GNU"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnuplot"

DEPEND="
	gnuplot? ( dev-ruby/gnuplot )
	app-benchmarks/httperf
	dev-lang/perl"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "make failed."
}

src_install() {
	emake PREFIX=${D} ROOTBIN_PREFIX=/usr ROOTMAN_PREFIX=/usr/share \
	AB_CFG=/etc/autobench.conf install || die "make install failed."
	
}
