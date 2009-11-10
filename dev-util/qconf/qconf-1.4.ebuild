# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4

DESCRIPTION="XML based generator of configure scripts for Qt4 apps"
HOMEPAGE="http://delta.affinix.com/qconf/"
SRC_URI="http://delta.affinix.com/download/qconf-1.4.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local configcmd="
		./configure
			--prefix=/usr
			--qtdir=/usr"

	echo ${configcmd}
	${configcmd} || die "configure failed"
}

src_install() {
	dobin qconf
	insinto usr/share/qconf/conf
	doins conf/*
	insinto usr/share/qconf/modules
	doins modules/*
}
