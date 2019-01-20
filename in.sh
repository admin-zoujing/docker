#!/bin/bash
CNAME=$1
CPID=$(docker inspect --format "{{.State.Pid}}" $CNAME)
nsenter --target "$CPID" --mount --uts --ipc --net --pid

#注意：安装util-linux包，使用nsenter.  用法：./in.sh mynginx
