# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-CSV/Text-CSV-1.210.0.ebuild,v 1.2 2011/09/03 21:05:22 tove Exp $

EAPI=4

MODULE_AUTHOR=RSCHUPP
inherit perl-module

DESCRIPTION="PAR component that can generate stand-alone executables and '.par' archives"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
>=dev-perl/Archive-Zip-1.00
>=dev-perl/Module-ScanDeps-1.01
>=dev-perl/PAR-Dist-0.22
>=dev-perl/PAR-1.000
>=dev-perl/Getopt-ArgvFile-1.07
"
RDEPEND="${DEPEND}"

SRC_TEST=do

