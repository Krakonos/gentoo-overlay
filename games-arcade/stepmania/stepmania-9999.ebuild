# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games mercurial autotools

EHG_REPO_URI="https://code.google.com/p/sm-ssc/"

DESCRIPTION="The dance simulator."
HOMEPAGE="http://www.stepmania.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug ffmpeg gtk jpeg mad vorbis"

RDEPEND="gtk? ( x11-libs/gtk+:2 )
	mad? ( media-libs/libmad )
	>=dev-lang/lua-5
	media-libs/libsdl[joystick,opengl]
	jpeg? ( virtual/jpeg )
	media-libs/libpng
	ffmpeg? ( virtual/ffmpeg )
	vorbis? ( media-libs/libvorbis )
	media-libs/glew
	virtual/opengl
	virtual/glu"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

EPATCH_OPTS=" --binary "
PATCHES=( "${FILESDIR}/remap.diff" )

src_prepare() {
	eautoreconf
	base_src_prepare
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_with debug) \
		$(use_with jpeg) \
		$(use_with vorbis) \
		$(use_with mad mp3) \
		$(use_enable gtk gtk2)
}

src_compile() {
	emake || die "emake died"
}

src_install() {
	local dir=${GAMES_DATADIR}/${PN}

	exeinto "${dir}"
	doexe src/stepmania || die "doexe failed"

	if use gtk; then
		doexe src/GtkModule.so || die "doexe failed"
	fi

	insinto "${dir}"
	doins -r Announcers BGAnimations Characters Courses Data \
	BackgroundEffects  BackgroundTransitions NoteSkins Themes || die "doins failed"

	newdoc Songs/instructions.txt song-instructions.txt

	#newicon "Themes/default/Graphics/Common	window icon.png" ${PN}.png
	#make_desktop_entry ${PN} StepMania

	games_make_wrapper ${PN} "${dir}"/${PN} "${dir}"
	prepgamesdirs

	einfo "Copy your music into ${dir}."
}
