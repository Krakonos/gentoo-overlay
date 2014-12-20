# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DBD-mysql/DBD-mysql-4.20.0.ebuild,v 1.11 2013/09/05 05:49:04 vapier Exp $

EAPI=5

MODULE_AUTHOR=DAM
MODULE_VERSION=1.16
inherit eutils perl-module

DESCRIPTION="The Perl DBD::Firebird Module"

SLOT="0"
KEYWORDS="amd64 x86"

#TODO: firebird dep?
RDEPEND="dev-perl/DBI"
DEPEND="${RDEPEND}"
