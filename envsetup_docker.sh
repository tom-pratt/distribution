#!/bin/sh

set -x

JELOS_PATH=`pwd`

export OS_VERSION=$(date +%Y%m%d) BUILD_DATE=$(date)
export DEVICE=RG353P ARCH=aarch64

m () {
  set -x
  ./scripts/clean $1
  ./scripts/build $1
  ./scripts/install $1
  set +x
}

i () {
  set -x
  ./scripts/image mkimage
  set +x
}

mi () {
  m $1
  i
}

alias applyes='git -C "$JELOS_PATH"/sources/emulationstation/emulationstation-* apply "$JELOS_PATH"/packages/ui/emulationstation/patches/bluetooth-settings.patch'
alias patches='git -C "$JELOS_PATH"/sources/emulationstation/emulationstation-* diff > "$JELOS_PATH"/packages/ui/emulationstation/patches/bluetooth-settings.patch'
alias mes='patches && m emulationstation && applyes'

set +x