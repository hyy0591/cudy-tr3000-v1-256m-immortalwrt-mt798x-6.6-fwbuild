#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.233.1/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Modify mimic Makefile
if [ -f  feeds/mimic/net/mimic/Makefile ]; then
    echo "[mimic] Makefile of mimic exists!"
else
    tree feeds
fi
sed -i "s/PKG_VERSION :=.*/PKG_VERSION := 0.7.1.20260615/g" feeds/mimic/net/mimic/Makefile
sed -i "s/PKG_RELEASE :=.*/PKG_RELEASE := 1/g" feeds/mimic/net/mimic/Makefile
sed -i "s/commit :=.*/commit := 96e0a316ec9b0b971866edada7bb3ccefe5a2d84/g" feeds/mimic/net/mimic/Makefile
sed -i "s/PKG_HASH := .*/PKG_HASH := 81739900338ac7310992b76941ffb53d68ac66a2154b8e5e7d09b3640ad739ad/g" feeds/mimic/net/mimic/Makefile
sed -i "s/CHECKSUM_HACK=kprobe/CHECKSUM_HACK=kfunc/g" feeds/mimic/net/mimic/Makefile
sed -i ':a;N;$!ba;s/\\\s*\n\s*COMPAT_LINUX_6_6=1//g' feeds/mimic/net/mimic/Makefile
echo "[mimic] Makefile after modifying: "
cat feeds/mimic/net/mimic/Makefile
