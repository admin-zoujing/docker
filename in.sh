#!/bin/bash
#使用docker attach有时会开住，并且退出会停止容器，使用下面脚本进入则可避免！
#yum -y install util-linux
CNAME=$1
CPID=$(docker inspect --format "{{ .State.Pid }}" $CNAME)
nsenter --target "$CPID" --mount --uts --ipc --net --pid

#注意：安装util-linux包，使用nsenter.  用法：./dockerin.sh mynginx
