# Docker 镜像管理

## 命令

### 镜像
* 拉取镜像  
```shell
docker pull centos:7
```
* 获取镜像列表  
```shell
docker images
```

* 编译镜像  
```shell
docker build -t qianqing/centos-nodejs:1 .
```

* 修改tag  
```shell
docker tag a11247e6b264 registry.cn-hangzhou.aliyuncs.com/qianqing/centos-nodejs:1
```


### 容器
* 启动容器并启动bash终端
```shell
docker run -t -i centos:7 /bin/bash
```
  (如果Dockerfile中有`CMD ["/bin/bash"]`命令，则启动时可以不带`/bin/bash`参数)
* 守护状态启动容器
```shell
docker run -dit centos:7
```
* 获取容器列表  
```shell
docker container ls
```
* 进入容器  
```shell
docker exec -it fc99401a7eec /bin/bash
```
* 停止容器  
```shell
docker container stop fc99401a7eec
```

### 仓库

* 登录dockerhub  
```shell
docker login
```

* 上传dockerhub
```shell
docker push qianqing/centos-nodejs:1
```

* 登录阿里云镜像  
```shell
docker login --username=qian.qing@aliyun.com registry.cn-hangzhou.aliyuncs.com
```

* 上传阿里云镜像  
```shell
docker push registry.cn-hangzhou.aliyuncs.com/qianqing/centos-nodejs:1
```