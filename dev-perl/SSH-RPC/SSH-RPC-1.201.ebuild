# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-CSV/Text-CSV-1.210.0.ebuild,v 1.2 2011/09/03 21:05:22 tove Exp $

EAPI=4

MODULE_AUTHOR=RIZEN
MODULE_VERSION=$PV

inherit perl-module

DESCRIPTION="Secure RPC over SSH."

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE="test"

RDEPEND="dev-perl/Net-OpenSSH
	dev-perl/JSON
	dev-perl/Class-InsideOut"
DEPEND="test? ( dev-perl/Test-Pod )
     $RDEPEND"

SRC_TEST=do
