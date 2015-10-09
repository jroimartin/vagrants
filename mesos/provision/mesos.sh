#!/bin/bash
set -e

MESOS_VERSION=0.24.0

mkdir -p ~/src/mesos/build
wget -q -O - http://www.apache.org/dist/mesos/${MESOS_VERSION}/mesos-${MESOS_VERSION}.tar.gz | \
	tar -xzf - -C ~/src/mesos --strip=1
cd ~/src/mesos/build && ../configure && make
