#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "Usage: sudo bootstrap-puppet.sh" 1>&2
   exit 1
fi

PUPPETMASTER="puppet"

# Installing Yum repo and puppet
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install puppet
echo "Puppet Installed"
