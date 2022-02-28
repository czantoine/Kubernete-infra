#!/bin/bash
apt-get update -y 
apt-get install nfs-kernel-server -y
mkdir /{mysql,html} >/dev/null 2>&1
chmod -R 755 /{mysql,html}
chown nobody:nogroup {/mysql,/html}
echo "/ *(rw,sync,no_root_squash,no_all_squash)" >> /etc/exports
service nfs-kernel-server restart