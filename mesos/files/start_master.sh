#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

/usr/share/zookeeper/bin/zkServer.sh start

mkdir -p /var/log/mesos
bin/mesos-master.sh --zk=zk://127.0.0.1:2181/mesos \
	--log_dir=/var/log/mesos \
	--logging_level=INFO \
	--quorum=1 \
	--registry=in_memory
