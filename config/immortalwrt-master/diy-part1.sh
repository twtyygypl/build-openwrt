# diy-part1.sh 脚本（用于自定义设置和修改）

# diy-part1.sh 通常用于做一些全局性的设置，比如添加默认包、修改内核配置、修改主机名等。
--------------------------------------------------------

#!/bin/bash

# 修改默认主机名
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 设置默认语言为简体中文
sed -i 's/CONFIG_LANG="en"/CONFIG_LANG="zh_CN"/' .config

# 开启某些额外的功能（例如 IPv6）
sed -i 's/CONFIG_IPV6=n/CONFIG_IPV6=y/' .config

# 选择默认的内核配置
sed -i 's/CONFIG_TARGET_x86_64=y/CONFIG_TARGET_x86_64=y/' .config
sed -i 's/CONFIG_TARGET_x86_64_DEFAULT=y/CONFIG_TARGET_x86_64_DEFAULT=y/' .config

# 添加自定义软件包
# 假设你已经准备好了额外的软件包目录
# echo 'src-git custom_packages https://github.com/yourusername/custom-packages' >> feeds.conf.default
# ./scripts/feeds update -a
# ./scripts/feeds install -a