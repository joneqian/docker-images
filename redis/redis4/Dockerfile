#基于centos7和nodejs10.x的Docker镜像 
FROM registry.cn-hangzhou.aliyuncs.com/qianqing/centos:7.5
MAINTAINER qianqing

# 安装redis环境
RUN \
  yum -y install tcl && \
  mkdir /home/download && \
  mkdir /data && \
  cd /home/download && \
  wget http://download.redis.io/releases/redis-4.0.10.tar.gz && \
  tar zxvf redis-4.0.10.tar.gz && \
  cd redis-4.0.10 && \
  make && \
  make test && \
  make install

EXPOSE 6379

CMD ["/bin/bash"]