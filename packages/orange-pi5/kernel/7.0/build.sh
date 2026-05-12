#!/bin/bash

main() {
  local kver=$1

  popd /usr/src/linux

  cp ${TARGETDIR}/config-${KVER} .config
  make oldconfig
  make -j"$(nproc)" Image modules dtbs
  if [ $? -ne 0 ]; then
    echo "Error on build Image/modules/dtdbs"
    return 1
  fi
  make modules_install
  cp arch/arm64/boot/Image ${TARGETDIR}/boot/vmlinuz-${KVER}
  cp System.map ${TARGETDIR}/boot/System.map-${KVER}
  cp -a arch/arm64/boot/dts/rockchip/*dtb arch/arm64/boot/dts/rockchip/*dtbo ${TARGETDIR}/boot/dtb-${KVER}/rockchip

  return 0
}

main $@
exit $?
