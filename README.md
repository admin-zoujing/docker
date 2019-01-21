# docker用法

#数据卷（默认目录/var/lib/docker/volumes/）

#docker run -it -d -v /data-volumes --name data-volumes docker.io/centos 

#docker run -it -d -v /home/data:/data-volumes --name data-volumes docker.io/centos 

#数据卷容器: docker run -it -d --volumes-from data-volumes --name nginx docker.io/centos

#数据卷容器来备份: docker run --volumes-from data-volumes -v $(pwd):/backup docker.io/centos tar cvf /backup/backup.tar

#数据卷容器来恢复: docker run -v /data-volumes --name data-volumes docker.io/centos /bin/bash

#数据卷容器来迁移: docker run --volumes-from data-volumes -v $(pwd):/backup docker.io/centos tar xvf /backup/backup.tar

# 查看docker信息
#docker exec data-volumes hostname
#docker exec data-volumes cat /etc/hosts
#docker exec data-volumes env
#docker inspect data-volumes
#docker top data-volumes 
