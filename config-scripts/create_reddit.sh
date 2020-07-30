yc compute instance create \
  --name reddit-from-image \
  --hostname from-image \
  --memory=4 \
  --create-boot-disk image-id='fd8t8usn11g7u1l71atl',size=10GB \
  --network-interface subnet-name=ru-central1-a-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key /home/alexander/.ssh/appuser.pub \
  --zone ru-central1-a