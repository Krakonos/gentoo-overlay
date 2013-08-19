# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 autotools

DESCRIPTION="A free VISA implementation."
HOMEPAGE="http://www.librevisa.org/"
EGIT_REPO_URI="http://www.librevisa.org/git/librevisa.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="usb tcp"

RDEPEND="usb? ( virtual/libusb )
	tcp? ( dev-libs/vxi )"
DEPEND="${RDEPEND}"

src_prepare() {
	eautoreconf || die "eautoreconf failed";
}
