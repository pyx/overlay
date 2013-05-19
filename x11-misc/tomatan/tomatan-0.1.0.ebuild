# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

VALA_USE_DEPEND="vapigen"
inherit vala

DESCRIPTION="TomaTan is a timer desinged for The Pomodoro Technique."
HOMEPAGE="https://bitbucket.org/pyx/tomatan/"
SRC_URI="https://bitbucket.org/pyx/${PN}/get/${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
	x11-libs/libnotify
	x11-libs/pango"

DEPEND="${RDEPEND}
	$(vala_depend)
	nls? ( sys-devel/gettext )
	virtual/pkgconfig"

pkg_setup() {
	export prefix=/usr
}

src_unpack() {
	unpack ${A}
	mv *${PN}* ${P} || die
}
