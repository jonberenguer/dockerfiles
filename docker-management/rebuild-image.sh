#!/bin/bash

DOCKERDIR=`pwd | sed 's/\/docker-management//'`

IMGNAME=$1
IMAGE=$USER/$IMGNAME

echo "docker directory: ${DOCKERDIR}"
echo "image name: ${IMAGE}"

if [ -d "${DOCKERDIR}"/${IMGNAME} ] ; then
 echo rebuilding $IMAGE ...
 docker rmi $IMAGE
 cd "$DOCKERDIR"/$IMGNAME
 pwd
 docker build -t $IMAGE .
 echo Completed!
else
 echo "Image directory doesn't exist."
 exit
fi
