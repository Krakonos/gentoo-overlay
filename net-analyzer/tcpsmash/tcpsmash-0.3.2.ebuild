# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Free & cool CLI network sniffer for Unix-like systems."
HOMEPAGE="http://0x00.ath.cx/prog/tcpsmash/"
SRC_URI="http://0x00.ath.cx/prog/tcpsmash/tcpsmash-${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/boehm-gc
		sys-libs/ncurses
		net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	# Patch conflicting getline with the one from glibc
	find ./ -name "*.[ch]" -exec sed -ie 's/getline()/my_getline()/g' {} \;
}

src_install() {
	dobin arpsmash
	dobin nctcpsmash
	dobin tcpsmash
	doman arpsmash.7.gz
	doman nctcpsmash.7.gz
	doman tcpsmash.7.gz
}
