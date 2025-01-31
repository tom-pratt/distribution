# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018 Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="misc-packages"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain Python3 jq ${ADDITIONAL_PACKAGES}"
PKG_SECTION="virtual"
PKG_LONGDESC="misc-packages: Metapackage for miscellaneous packages"

# Entware support
if [ "$ENTWARE_SUPPORT" = "yes" ]; then
  ln -sf /storage/.opt $INSTALL/opt
  PKG_DEPENDS_TARGET+=" entware"
fi
