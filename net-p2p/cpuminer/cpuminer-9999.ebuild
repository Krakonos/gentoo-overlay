# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2

EAPI=4

DESCRIPTION="Cpuminer for litecoin."
HOMEPAGE="https://github.com/pooler/cpuminer"
EGIT_REPO_URI="https://github.com/pooler/cpuminer.git"
#EGIT_BRANCH="cpumine"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_prepare() {
	./autogen.sh
}

src_configure() {
	./configure --prefix=/usr
	sed -i 's:INSTALL = /usr/bin/install -c:INSTALL = /usr/bin/install -m 755:' \
		Makefile x86_64/Makefile
}


src_install() {
	emake DESTDIR="${D}" install || die

	newinitd ${FILESDIR}/initd.minerd minerd || die
	newconfd ${FILESDIR}/confd.minerd minerd || die
}
