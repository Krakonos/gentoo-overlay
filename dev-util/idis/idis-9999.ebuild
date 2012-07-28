# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="An Interactive DISassembler."
HOMEPAGE="http://idis.krakonos.org/"
EGIT_REPO_URI="git://git.krakonos.org/idis.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-libs/libyaml
	>=dev-lang/python-3.0
	>=x11-libs/gtk+-3.0"
DEPEND="${RDEPEND}
	>=dev-lang/swig-2.0.4"

src_compile() {
	cd src
	emake PREFIX=/usr || die "emake failed."
}

src_install() {
	cd src
	make PREFIX=/usr DESTDIR="${D}" install || die "install failed"
}
