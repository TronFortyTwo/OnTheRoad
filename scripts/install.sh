#!/bin/bash

mkdir -p ~/.cache/ontheroad.emanuelesorce/bin/

cp /opt/click.ubuntu.com/ontheroad.emanuelesorce/current/scripts/otr ~/.cache/ontheroad.emanuelesorce/bin/

echo "export PATH=\$PATH:~/.cache/ontheroad.emanuelesorce/bin" >> ~/.bashrc
