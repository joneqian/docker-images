# 拉取镜像

docker pull mysql:8.0

# 拉取镜像并创建容器

# 如果只允许本机访问，请将 0.0.0.0 改成 127.0.0.1

docker run -d --restart=always -p 0.0.0.0:4306:3306 -v /data/mysql8/log:/var/log/mysql -v /data/mysql8/my.cnf:/etc/my.cnf -e MYSQL_ROOT_PASSWORD=Myun@123jx -e MYSQL_GENERAL_LOG=1 mysql:8.0

# 从 docker 中导出数据库 sql

docker exec -it distracted_shirley mysqldump -uroot -pMyun@123jx shehuizhili_yjxy > shehuizhili_yjxy.sql
