#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "Usage: sudo bootstrap-puppet.sh" 1>&2
   exit 1
fi


yum install -y epel-release python-pip gcc make

sudo pip install ansible

