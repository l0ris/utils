#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "Usage: sudo bootstrap-puppet.sh" 1>&2
   exit 1
fi

PUPPETMASTER="puppet.sysops.lab"

# Installing Yum repo and puppet
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install puppet-server postgresql-server puppetdb puppetdb-terminus
echo "Puppet Installed"
# Initial puppet run!
#puppet agent -tv --noop --server $PUPPETMASTER 

# Install some puppet modules 
sudo puppet module install -i /etc/puppet/environments/production/modules puppetlabs-ntp
sudo puppet module install -i /etc/puppet/environments/production/modules puppetlabs-git
sudo puppet module install -i /etc/puppet/environments/production/modules puppetlabs-vcsrepo
sudo puppet module install -i /etc/puppet/environments/production/modules wazuh-ossec

