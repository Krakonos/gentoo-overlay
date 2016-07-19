# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="A microbenchmark support library from Google."
HOMEPAGE="https://github.com/google/benchmark"
SRC_URI="https://github.com/google/benchmark/archive/v1.0.0.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/cmake"
RDEPEND="${DEPEND}"

S="${WORKDIR}/benchmark-${PV}"

src_configure() {
	local mycmakeargs=( -DBENCHMARK_ENABLE_TESTING=OFF )
	cmake-utils_src_configure
}
