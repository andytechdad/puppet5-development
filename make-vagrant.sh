#!/bin/sh
echo "Adding the newly created packer box to vagrant"
cd vagrant
vagrant box add ../packer/centos7/builds/puppet5-dev.box --name puppet5-development
vagrant init puppet5-development
