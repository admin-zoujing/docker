#This docker file use the centos image
#VERSION 1
#Auther: zoujing

#BASE images
FROM centos:latest

#MAINTAINER
MAINTAINER zoujing 489548322@qq.com

ENV NGINX_VERSION 1.15.8

#RUN 
RUN yum install -y gcc gcc-c++ make cmake openssl-devel pcre-devel zlib   
RUN useradd -r -s /sbin/nologin -M www 
RUN curl -Lk http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz | gunzip | tar x -C /usr/local/src

#WORKDIR
WORKDIR /usr/local/src/nginx-$NGINX_VERSION 
RUN ./configure --prefix=/usr/local/nginx --user=www --group=www --with-pcre --with-http_ssl_module --without-mail_pop3_module --without-mail_imap_module --with-http_gzip_static_module && make && make install 
RUN echo "daemon off;" >> /usr/local/nginx/conf/nginx.conf

#EXPOSE
EXPOSE 80 

#CMD
CMD /usr/local/nginx/sbin/nginx

#usage: docker build -t nginx:1.15.8 /opt/docker-file/nginx/
#usage: docker run -it -d -p 80:80 --name nginxserver1 nginx:1.15.8
