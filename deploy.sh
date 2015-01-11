#!/bin/sh

mkdir tools
cd tools
git clone git@github.com:andboson/tools.git .

if [ ! -z "$1" ]
then
git checkout $1
exit
fi

git checkout docker-dev-run && mkdir docker-dev-run && cp -r * docker-dev-run/
git checkout docker-dev-build && mkdir docker-dev-build && cp -r * docker-dev-build/
git checkout db-ssh-sync && mkdir db-ssh-sync && cp -r * db-ssh-sync/
git checkout vagrant-run && mkdir vagrant-run && cp -r * vagrant-run/

