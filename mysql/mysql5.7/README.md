# 拉取镜像

docker pull mysql:5.7.27

# 拉取镜像并创建容器

# 如果只允许本机访问，请将 0.0.0.0 改成 127.0.0.1

docker run -d -p 0.0.0.0:4306:3306 -v /var/log/mysql:/var/log/mysql -v ./my.cnf:/etc/my.cnf -e MYSQL_ROOT_PASSWORD=Myun@123jx -e MYSQL_GENERAL_LOG=1 mysql:5.7.27

docker exec -it distracted_shirley mysqldump -uroot -pMyun@123jx shehuizhili_yjxy > shehuizhili_yjxy.sql
