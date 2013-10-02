#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get -qq update
apt-get -y --force-yes install lxc-docker
