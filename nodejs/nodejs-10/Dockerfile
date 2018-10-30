#基于centos7和nodejs10.x的Docker镜像 
FROM registry.cn-hangzhou.aliyuncs.com/qianqing/centos:7.5
MAINTAINER qianqing

# 安装node环境 最新LTS版本, 并配置node环境
RUN \
  curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
  yum -y install nodejs && \
  npm install -g pm2 --registry=https://registry.npm.taobao.org

CMD ["/bin/bash"]