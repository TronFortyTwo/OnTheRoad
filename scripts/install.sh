#!/bin/bash

mkdir -p /home/phablet/.cache/ontheroad.emanuelesorce/bin

cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr /home/phablet/.cache/ontheroad.emanuelesorce/bin/
cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr-ssh /home/phablet/.cache/ontheroad.emanuelesorce/bin/

echo "export PATH=\$PATH:~/.cache/ontheroad.emanuelesorce/bin" >> /home/phablet/.bashrc
