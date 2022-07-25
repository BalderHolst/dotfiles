#!/bin/zsh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo -e "WIFI\t PASSWORD\n===================="

sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ | cut -d/ -f5 | sed 's/.nmconnection:psk=/;-;/' | awk -F ";-;" '{ print $1"\t"$2 }'
