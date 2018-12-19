#!/bin/sh -eu

# 如果只允许本机访问，请将0.0.0.0改成127.0.0.1
docker run -d -p 0.0.0.0:4306:3306 -v /var/log/mysql:/var/log/mysql -e MYSQL_ROOT_PASSWORD=Myun@123jx -e MYSQL_GENERAL_LOG=1 qianqing/mysql5.7