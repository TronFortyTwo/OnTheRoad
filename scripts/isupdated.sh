#!/bin/bash

isinstalled=$(/opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/isinstalled.sh)

if [ ! isinstalled ]; then
	exit 0
fi

if diff /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr ~/.cache/ontheroad.emanuelesorce/bin/otr >/dev/null ; then
<<<<<<< HEAD
	if diff /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr-ssh ~/.cache/ontheroad.emanuelesorce/bin/otr-ssh >/dev/null ; then
		exit 1
	else
		exit 0
	fi
=======
	exit 1
>>>>>>> e9e0b47ef938b8fe6f0260b0e2e08b8014035c16
else
	exit 0
fi
