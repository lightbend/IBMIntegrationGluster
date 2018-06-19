#!/usr/bin/env bash

sudo dmsetup remove_all
sudo wipefs -a /dev/xvdi

sudo rm -rf /var/lib/glusterd/
sudo rm -rf /var/lib/misc/glusterfsd/
sudo rm -rf /etc/glusterfs/
sudo rm -rf /var/lib/heketi/
