#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

mkdir -p /var/log/mesos
bin/mesos-slave.sh --master=zk://127.0.0.1:2181/mesos \
	--log_dir=/var/log/mesos \
	--logging_level=INFO \
	--no-switch_user
