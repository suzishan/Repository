#!/bin/bash

# 生成的订阅文件放在网站根目录下
# filePath='~/www/xray' 保留单引号在Ubuntu下导致no such file or directory的错误提示，不知何故。。。
filePath=~/www/xray

# 随机生成40000~50000之间的一个随机数
randPort=$((RANDOM % 10000 + 40000))   

# 下面的是我的trojan节点信息
echo -e \
"
vless://45c72176-cffa-4366-96c9-54ef4ad68297@www.suzishan.com:443?type=tcp&encryption=none&security=xtls&path=%2f&headerType=none&flow=xtls-rprx-direct#vless-tcp-xtls
# trojan://GwZOlMiB@domain.com:443#JP1
" \
| sed "s/443/$randPort/g" | base64 > $filePath
# 将更换端口后的节点信息base64写入文件

echo "Current Port: "$randPort
