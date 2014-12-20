# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-CSV/Text-CSV-1.210.0.ebuild,v 1.2 2011/09/03 21:05:22 tove Exp $

EAPI=5

MODULE_AUTHOR=BABF
MODULE_VERSION=1.01
inherit perl-module

DESCRIPTION="Manipulate comma-separated value strings"

SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE="test"

RDEPEND=""
DEPEND="test? ( dev-perl/Test-Pod )
	dev-perl/Text-CSV"

SRC_TEST=do
