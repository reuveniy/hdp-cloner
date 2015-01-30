#!/bin/bash

if [ -z `which yum` ]; then echo "Yum is not installed. make sure you are running update on a Centos machine."; exit; fi;
if [ ! -d /vagrant ]; then echo "Missing vagrant mount point"; exit; fi;

sudo yum install -y yum-utils nano createrepo
wget -nv -q http://public-repo-1.hortonworks.com/HDP/centos6/2.x/GA/2.2.0.0/hdp.repo -O /etc/yum.repos.d/hdp.repo
sudo yum repolist
mkdir -p /vagrant/yum
cd /vagrant/yum
reposync -n -l --repoid=HDP-2.2.0.0
reposync -n -l --repoid=HDP-UTILS-1.1.0.20

createrepo /vagrant/yum/HDP-2.2.0.0
createrepo /vagrant/yum/HDP-UTILS-1.1.0.20
