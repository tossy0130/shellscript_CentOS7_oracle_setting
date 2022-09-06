#!/bin/sh

###### SELINUX 無効

# コピー
cp -piv /etc/selinux/config /etc/selinux/config.`date "+%Y%m%d"`
# 無効
sudo sed -i -e "s/^SELINUX=enforcing$/SELINUX=disabled/g"

### シャットダウン
shutdown -r now


