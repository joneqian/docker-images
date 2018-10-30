### 启动命令
```shell
docker run -d --privileged=true -p 6379:6379 -v /Users/qianqing/src/docker/redis/redis-4/redis.conf:/etc/redis/redis.conf -v /Users/qianqing/src/docker/redis/redis-4/data:/data --name redis registry.cn-hangzhou.aliyuncs.com/qianqing/redis:4 redis-server /etc/redis/redis.conf
```

### 说明

-p 6379:6379:把容器内的6379端口映射到宿主机6379端口  

-v /root/redis/redis.conf:/etc/redis/redis.conf：把宿主机配置好的redis.conf放到容器内的这个位置中  

-v /root/redis/data:/data：把redis持久化的数据在宿主机内显示，做数据备份  

redis-server /etc/redis/redis.conf：这个是关键配置，让redis不是无配置启动，而是按照这个redis.conf的配置启动  

–appendonly yes：redis启动后数据持久化