<!--
 * @Author: leyi leyi@myun.info
 * @Date: 2021-02-01 12:06:26
 * @LastEditors: leyi leyi@myun.info
 * @LastEditTime: 2023-12-06 18:24:04
 * @FilePath: /docker-images/mysql/mysql8/README.md
 * @Description:
 *
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved.
-->

# 拉取镜像

docker pull mysql:8.0

# 拉取镜像并创建容器

# 如果只允许本机访问，请将 0.0.0.0 改成 127.0.0.1

mkdir -p /data/mysql8/log
mkdir -p /data/mysql8/data
docker run -d --restart=always -p 0.0.0.0:4306:3306 -v /data/mysql8/data:/var/lib/mysql -v /data/mysql8/log:/var/log/mysql -v /data/mysql8/my.cnf:/etc/my.cnf -e MYSQL_ROOT_PASSWORD=Myun@123jx -e MYSQL_GENERAL_LOG=1 mysql:8.0

# 从 docker 中导出数据库 sql

docker exec -it 容器 ID mysqldump -uroot -pMyun@123jx 数据库命 > back.sql
