#基于centos镜像 
FROM centos:7.6.1810
LABEL maintainer="qian.qing@aliyun.com"

#修改linux内核
RUN \
  yum -y update && \
  yum -y install vim wget git net-tools gcc-c++ make telnet tcl && \
  yum -y install reinstall kde-l10n-Chinese glibc-common && \
  yum -y install pcre pcre-devel zlib zlib-devel openssl openssl-devel && \
  yum clean all

RUN \
  localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
  export LANG=zh_CN.UTF-8 && \
  echo "export LANG=zh_CN.UTF-8" >> /etc/locale.conf && \
  mkdir /home/download

# 安装node环境 最新LTS版本, 并配置node环境
RUN \
  curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
  yum -y install nodejs && \
  npm install -g pm2 yarn --registry=https://registry.npm.taobao.org && \
  yum clean all

#将nginx和redis包放入/home/download并自动解压
ADD nginx-1.14.2.tar.gz /home/download
ADD redis-4.0.14.tar.gz /home/download
ADD startup.sh /home/download

# 安装nginx
# 改变当前目录到nginx安装目录
WORKDIR /home/download/nginx-1.14.2
RUN \
  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module && \
  make && \
  make install && \
  mkdir /usr/local/nginx/conf.d && \
  mkdir /usr/local/nginx/cert

ADD https://qq-developer.oss-cn-hangzhou.aliyuncs.com/nginx_config/nginx.conf /usr/local/nginx/conf/nginx.conf
ADD https://qq-developer.oss-cn-hangzhou.aliyuncs.com/nginx_config/web-site.conf /usr/local/nginx/conf.d/

# 安装redis
WORKDIR /home/download/redis-4.0.14

RUN \
  make && \
  make test && \
  make install && \
  /bin/cp -rf redis.conf /etc/ && \
  sed -e "s/^daemonize no$/daemonize yes/" -e "s/^stop-writes-on-bgsave-error yes$/stop-writes-on-bgsave-error no/" -e "s/^# bind 127.0.0.1$/bind 127.0.0.1/" -e "s/^loglevel verbose$/loglevel notice/" -e "s/^logfile stdout$/logfile \/var\/log\/redis.log/" redis.conf > /etc/redis.conf

WORKDIR /home/download

RUN \
  chmod +x startup.sh 

ENV  LANG zh_CN.UTF-8
ENV  LC_ALL zh_CN.UTF-8

CMD ["/usr/sbin/init"]