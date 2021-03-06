# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_DOTNET="net40"

inherit git-2 autotools dotnet

DESCRIPTION="The F# Compiler"
HOMEPAGE="https://github.com/fsharp/fsharp"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="+unicode"

if use unicode; then
	EGIT_REPO_URI="git://github.com/Heather/fsharp.git"
	EGIT_MASTER="heather"
else
	EGIT_REPO_URI="git://github.com/fsharp/fsharp.git"
	EGIT_MASTER="master"
fi

MAKEOPTS="-j1" #nowarn
DEPEND="|| ( >dev-lang/mono-3.0.6 <dev-lang/mono-3.0.5 )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_install() {
	default
	dosym /usr/bin/fsharpc /usr/bin/fsc
}
