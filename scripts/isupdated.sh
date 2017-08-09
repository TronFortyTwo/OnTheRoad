#!/bin/bash

isinstalled=$(/opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/isinstalled.sh)

if [ ! isinstalled ]; then
	exit 0
fi

if diff /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr ~/.cache/ontheroad.emanuelesorce/bin/otr >/dev/null ; then
	if diff /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr-ssh ~/.cache/ontheroad.emanuelesorce/bin/otr-ssh >/dev/null ; then
		exit 1
	else
		exit 0
	fi
else
	exit 0
fi
