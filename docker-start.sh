#!/bin/bash

# image ID or image name
IMAGE=andboson/ubuntu:12.04.dev

# apache configs
CONFIG_DIR=conf


################
CURR_DIR=`pwd`

if [ -n $1 ] 
    then
    OPT=" -t -i "
fi

if [ -d "$CONFIG_DIR" ]
    then
    APACHE_CONFIG="-v $CURR_DIR/$CONFIG_DIR:/var/conf"
fi

sudo docker run $OPT $APACHE_CONFIG -v $CURR_DIR/:/var/www --net=host $IMAGE $1
