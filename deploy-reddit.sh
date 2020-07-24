#!/bin/bash

echo $1

yc compute instance create \
--name "$1" \
--hostname "$1" \
--memory=4 \
--create-boot-disk image-folder-id=b1ga0cmqqghggdje2gi1,image-family=reddit-full,size=20GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=metadata.yaml \
--ssh-key ~/.ssh/id_rsa.pub
