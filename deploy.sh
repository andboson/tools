#!/bin/sh

mkdir tools
cd tools
git clone git@github.com:andboson/tools.git .

if [ ! -z "$1" ]
then
git checkout $1
exit
fi

mkdir docker-dev-run && cp -r .git docker-dev-run/ && cd  docker-dev-run && git checkout docker-dev-run
cd .. && mkdir docker-dev-build && cp -r .git docker-dev-build/ && cd  docker-dev-build && git checkout docker-dev-build
cd .. && mkdir db-ssh-sync && cp -r .git db-ssh-sync/ && cd db-ssh-sync && git checkout db-ssh-sync
cd .. && mkdir vagrant-run && cp -r .git vagrant-run/ && cd vagrant-run && git checkout vagrant-run
cd ..