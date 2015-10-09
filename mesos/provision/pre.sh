#!/bin/bash
set -e

apt-get update

# General
apt-get install -y --no-install-recommends wget curl git build-essential

# Mesos
apt-get install -y --no-install-recommends openjdk-7-jdk autoconf libtool \
	build-essential python-dev python-boto libcurl4-nss-dev libsasl2-dev \
	maven libapr1-dev libsvn-dev zookeeper

apt-get clean
