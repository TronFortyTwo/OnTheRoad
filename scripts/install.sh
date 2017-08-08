#!/bin/bash

mkdir -p /home/phablet/.cache/ontheroad.emanuelesorce/bin
<<<<<<< HEAD

cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr /home/phablet/.cache/ontheroad.emanuelesorce/bin/
cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr-ssh /home/phablet/.cache/ontheroad.emanuelesorce/bin/

echo "export PATH=\$PATH:~/.cache/ontheroad.emanuelesorce/bin" >> /home/phablet/.bashrc
=======
mkdir -p /home/phablet/.cache/ontheroad.emanuelesorce/containers

cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr /home/phablet/.cache/ontheroad.emanuelesorce/bin/

echo "export PATH=\$PATH:~/.cache/ontheroad.emanuelesorce/bin" >> ~/.bashrc
>>>>>>> e9e0b47ef938b8fe6f0260b0e2e08b8014035c16
