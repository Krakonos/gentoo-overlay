# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="The OpenBSD's iked port."
HOMEPAGE="https://github.com/reyk/openiked/"
EGIT_REPO_URI="https://github.com/reyk/openiked.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/openssl-1.0.0
	>=dev-libs/libevent-1.4.0
"
DEPEND="${RDEPEND}
	sys-devel/automake:1.11"

src_prepare() {
	./bootstrap
}
