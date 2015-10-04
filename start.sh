#!/bin/bash
if [ ! -z $1 ];then
    port=$1
else
    port=8005
fi
docker run -d -p $port:80 -v $(pwd):/data/www 104.131.154.5:5000/node-hexo
