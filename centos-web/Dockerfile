#基于centos镜像 
FROM qianqing/centos:7.5
MAINTAINER qianqing
#  安装基础软件 wget git
RUN yum -y update
RUN yum -y install wget
RUN yum -y install git
RUN yum -y install net-tools
RUN yum -y install gcc-c++ make
RUN mkdir -p /home/src
WORKDIR /home/src
# 安装node环境 最新LTS版本, 并配置node环境
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install nodejs
RUN npm install -g pm2 --registry=https://registry.npm.taobao.org
CMD ["/bin/bash"]