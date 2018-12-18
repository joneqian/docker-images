#基于centos镜像 
FROM centos:7.5.1804
MAINTAINER qianqing

#修改linux内核
RUN \
  yum -y update && \
  yum -y install vim wget git net-tools gcc-c++ make telnet && \
  yum clean all

CMD ["/bin/bash"]