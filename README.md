# Docker 镜像管理

## 命令

### 安装

```shell
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
```

### 安装（阿里云镜像）

```shell
# step 1: 安装必要的一些系统工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Step 2: 添加软件源信息
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# Step 3
sudo sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
# Step 4: 更新并安装Docker-CE
sudo yum makecache fast
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Step 4: 开启Docker服务
sudo service docker start
# 开机自启动
sudo systemctl enable docker
```

- 配置镜像加速

```shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://<your_registry_token>.mirror.aliyuncs.com",
    "https://hub.uuuadc.top",
    "https://docker.anyhub.us.kg",
    "https://dockerhub.jobcher.com",
    "https://dockerhub.icu",
    "https://docker.ckyl.me",
    "https://docker.awsl9527.cn",
    "https://dockerproxy.com",
    "https://docker.mirrors.ustc.edu.cn",
    "https://docker.nju.edu.cn"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

- 拉取镜像

```shell
docker pull centos:7
```

- 获取镜像列表

```shell
docker images
```

- 删除镜像

```shell
docker rmi 0126d126e6a6
```

- 编译镜像

```shell
docker build -t qianqing/centos-nodejs:1 .
```

- 修改 tag

```shell
docker tag a11247e6b264 registry.cn-hangzhou.aliyuncs.com/qianqing/centos-nodejs:1
```

### 容器

- 创建和启动容器并启动 bash 终端

```shell
docker run --privileged -it centos:7 /usr/sbin/init
```

(如果 Dockerfile 中有`CMD ["/bin/bash"]`命令，则启动时可以不带`/bin/bash`参数)

- 守护状态启动容器

```shell
docker run --privileged --net=host -dit centos:7
```

(`--privileged`获取特权，`--net=host`和宿主机共用网卡)

- 获取容器列表

```shell
docker container ls -a
```

- 进入容器

```shell
docker exec -it fc99401a7eec /bin/bash
```

- 停止容器

```shell
docker container stop fc99401a7eec
```

- 启动已终止容器

```shell
docker container start fc99401a7eec
```

- 删除容器

```shell
docker container rm 1b12f05fc135
```

- 修改容器配置
  docker update bacd1776699d --restart=always

### 仓库

- 登录 dockerhub

```shell
docker login
```

- 上传 dockerhub

```shell
docker push qianqing/centos-nodejs:1
```

- 登录阿里云镜像

```shell
docker login --username=qian.qing@aliyun.com registry.cn-hangzhou.aliyuncs.com
```

- 上传阿里云镜像

```shell
docker push registry.cn-hangzhou.aliyuncs.com/qianqing/centos-nodejs:1
```

### 删除无用数据

- 删除无用的镜像

```shell
docker image prune
```

- 删除无用的容器

```shell
docker container prune
```

- 删除无用的卷

```shell
docker volume prune
```

- 删除无用的网络

```shell
docker network prune
```

- 删除无用的镜像、容器、卷、网络

```shell
docker system prune
```
