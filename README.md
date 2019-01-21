# docker用法

# 查看docker信息
#主机名称：docker exec data-volumes hostname

#网络地址：docker exec data-volumes cat /etc/hosts

#环境配置：docker exec data-volumes env

#具体信息：docker inspect data-volumes

#使用效率：docker top data-volumes 

#映射端口：docker port data-volumes  80

# 数据卷
#数据卷（默认目录/var/lib/docker/volumes/）:
docker run -it -d -v /data-volumes --name data-volumes docker.io/centos 

#数据卷(映射目录/home/data)
docker run -it -d -v /home/data:/data-volumes --name data-volumes docker.io/centos 

#数据卷容器: 
docker run -it -d --volumes-from data-volumes --name nginx docker.io/centos

#数据卷容器来备份: 
docker run --volumes-from data-volumes -v $(pwd):/backup docker.io/centos tar cvf /backup/backup.tar

#数据卷容器来恢复: 
docker run -v /data-volumes --name data-volumes docker.io/centos /bin/bash

#数据卷容器来迁移: 
docker run --volumes-from data-volumes -v $(pwd):/backup docker.io/centos tar xvf /backup/backup.tar

# 网络
#外部访问容器：
docker run -it -d -p 192.168.8.52:80:80/tcp --volumes-from data-volumes --name nginx nginx:1.15.8

#容器互联：
docker run -it -d -p 192.168.8.52:6379:6379/tcp --volumes-from data-volumes --link redis:redis --name nginx nginx:1.15.8
