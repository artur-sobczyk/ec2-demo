#!/bin/bash

wget https://raw.githubusercontent.com/artur-sobczyk/ec2-demo/main/template.html

export INSTANCE_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
export INSTANCE_TYPE=`curl http://169.254.169.254/latest/meta-data/instance-type`
export PUBLIC_IP=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
export PRIVATE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
export MAC=`curl http://169.254.169.254/latest/meta-data/network/interfaces/macs`
export AZ=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`
export AZ_ID=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone-id`
export SUBNET=`curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC/subnet-id`

export VERSION="1.0.0"
export DATE=`date --utc +%FT%T%Z`

envsubst < template.html | tee index.html

