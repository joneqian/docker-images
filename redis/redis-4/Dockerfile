#基于centos7和nodejs10.x的Docker镜像 
FROM centos:7
MAINTAINER qianqing
#  安装基础软件 wget git
RUN yum -y update
RUN yum -y install tcl gcc-c++
RUN yum clean all

# 安装node环境 最新LTS版本, 并配置node环境
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install nodejs
RUN npm install -g pm2 --registry=https://registry.npm.taobao.org

CMD ["/bin/bash"]