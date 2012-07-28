# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="User-space driver for USB-enabled Olympus DVRs that do not support the USB Mass Storage."
HOMEPAGE="http://code.google.com/p/odvr/"
SRC_URI="http://odvr.googlecode.com/files/${PF}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
		dev-libs/libusb
		media-libs/libsndfile"

RDEPEND="
		${DEPEND}
		sys-fs/udev"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin odvr
	dobin odvr-gui
	insinto /etc/udev/rules.d
	doins 41-odvr.rules
	dodoc README
}

pkg_postinst() {
	elog ""
	elog "You will need to reload udev rules prior running ${PN}:"
	elog "# udevadm control --reload-rules"
	elog ""
}
