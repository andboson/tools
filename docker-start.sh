#!/bin/bash

# image ID or image name
IMAGE=andboson/ubuntu:12.04.dev

# apache configs
CONFIG_DIR=conf

# run interactive
OPT="-t -i"

################
CURR_DIR=`pwd`

if [ ! -z "$1" ] 
    then
    echo "IMAGE $1"
    IMAGE=$1
fi

if [ -d "$CONFIG_DIR" ]
    then
    APACHE_CONFIG="-v $CURR_DIR/$CONFIG_DIR:/var/conf"
fi

echo " === print config:"
echo "docker run $OPT $APACHE_CONFIG -v $CURR_DIR/:/var/www --net=host $IMAGE"

echo " === now entereng to container"
sudo docker run $OPT $APACHE_CONFIG -v $CURR_DIR/:/var/www --net=host $IMAGE
