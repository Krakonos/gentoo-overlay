# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/wxperl/wxperl-0.991.700.ebuild,v 1.1 2013/02/18 19:06:55 tove Exp $

EAPI=5

MY_PN=Wx
WX_GTK_VER="3.0"
MODULE_AUTHOR=MDOOTSON
MODULE_VERSION=0.9923
inherit wxwidgets perl-module

DESCRIPTION="Perl bindings for wxGTK"
HOMEPAGE="http://wxperl.sourceforge.net/ ${HOMEPAGE}"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-perl/Alien-wxWidgets-0.25
	>=virtual/perl-File-Spec-0.82
	x11-libs/wxGTK:3.0
"
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-ParseXS-0.22.03
	>=dev-perl/ExtUtils-XSpp-0.160.200
"

MAKEOPTS="${MAKEOPTS} -j1"
