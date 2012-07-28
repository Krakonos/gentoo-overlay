# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

EGIT_REPO_URI="git://git.psi-im.org/psi.git"
EGIT_BRANCH="master"

inherit git qt4 eutils

DESCRIPTION="Qt4 Jabber client, with Licq-like interface"
HOMEPAGE="http://psi-im.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="crypt dbus debug doc jingle spell ssl xscreensaver -plugins"

RDEPEND=">=x11-libs/qt-gui-4.4:4[qt3support,dbus?]
	>=app-crypt/qca-2.0.2:2
	spell? ( app-text/aspell )
	xscreensaver? ( x11-libs/libXScrnSaver )
	app-arch/unzip"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	plugins? ( dev-util/qconf )"

PDEPEND="crypt? ( app-crypt/qca-gnupg:2 )
	jingle? ( net-im/psimedia )
	ssl? ( app-crypt/qca-ossl:2 )"

src_unpack() {
	git_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}/520-psi-fix-ability-to-modify-events-from-plugins.diff"

	if use plugins; then
		sed -i -e "s/<\!--\(.*plugins.*\)-->/\\1/" psi.qc
		/usr/bin/qconf psi.qc
	fi
}
src_configure() {
	local confcmd="./configure
		--prefix=/usr
		--qtdir=/usr
		--disable-bundled-qca
		--disable-growl
		$(use plugins && echo '--enable-plugins')
		$(use dbus || echo '--disable-qdbus')
		$(use debug && echo '--enable-debug')
		$(use spell || echo '--disable-aspell')
		$(use xscreensaver || echo '--disable-xss')"
	echo ${confcmd}
	${confcmd} || die "configure failed"
}

src_compile() {
	eqmake4
	emake || die "emake failed"

	# Build documentation if requested
	if use doc; then
		cd doc
		mkdir -p api # 259632
		make api_public || die "make api_public failed"
	fi

}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"
	rm "${D}"/usr/share/psi/{COPYING,README}

	# this way the docs will be installed in the standard gentoo dir
	newdoc iconsets/roster/README README.roster || die
	newdoc iconsets/system/README README.system || die
	newdoc certs/README README.certs || die
	dodoc README || die

	if use doc; then
		cd doc
		dohtml -r api || die "dohtml failed"
	fi

	# install translations
	cd "${WORKDIR}"
	insinto /usr/share/${PN}/
	for LNG in ${LANGS}; do
		if use linguas_${LNG}; then
			doins ${LNG}/${PN}_${LNG}.qm || die
		fi
	done
}
