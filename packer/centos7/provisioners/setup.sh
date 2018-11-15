#!/bin/sh
yum -y install wget
echo "lets sort out the Vagrant keys"
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
exit
echo "SELinux to Permissive and Disable FirewallD"
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
echo "Starting with epel repo"
yum -y install wget
## RHEL/CentOS 7 64-Bit ##
rpm -Uvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum clean all
echo "Then adding puppet repos" #add puppet 5 here
sudo rpm -Uvh http://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
echo "Installing Puppet and other packages"
yum -y install puppet
echo "Lets install the rubygems we need"
gem install eyaml
puppet --version
