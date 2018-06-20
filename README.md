# Gluster support

Is implemented based on [gluster-kubernetes](https://github.com/gluster/gluster-kubernetes).
It builds a docker image based on the conten of the project and provides a helm chart for its run.

## Prerequisites

Default image of Centos is missing several libraries required for Gluster. THe can be installed using the following commands:
1. Install lvm2

````    
sudo su
yum install lvm2
````
2. Install dm-thin pool 		
````
sudo modprobe dm_thin_pool

# Load kernel module on boot
echo 'dm_thin_pool' | sudo tee /etc/modules-load.d/dm_thin_pool.conf
````
Check if install correct
````
lsmod | grep dm_thin_pool
````
3 Install glusterfs-fuse		
````
sudo su
yum install glusterfs glusterfs-fuse attr -y
````
## install
Just install using provided Helm chart. Make sure to update topology.jso to your configuration.
It is defined in values.yaml - `topology`

## Cleanup
In the case of failures and/or reinstalls, the following clean up is require
1. remove glusterfs daemon set
2. Delete heketi-service-account
1. Run [cleanup.sh](docker/gluster-kubernetes/deploy/cleanup.sh) script on every node, where gluster was installed
2. Reboot those nodes
