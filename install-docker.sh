#!/bin/sh

apt-get update

apt-get install -y
apt-get install apt-transport-https -y
apt-get install ca-certificates -y
apt-get install curl -y
apt-get install gnupg-agent -y
apt-get install software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

