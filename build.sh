#!/bin/sh
#step one, build your centos vm with packer and create a vagrant file
cd packer/centos7
packer build centos7.json
