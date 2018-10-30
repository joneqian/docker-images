#基于centos7和nodejs10.x的Docker镜像 
FROM centos:7
MAINTAINER qianqing
# 安装node环境 最新LTS版本, 并配置node环境
RUN \
  yum -y update && \
  yum -y install wget git net-tools gcc-c++ make && \
  yum clean all && \
  curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
  yum -y install nodejs && \
  npm install -g pm2 --registry=https://registry.npm.taobao.org

CMD ["/bin/bash"]