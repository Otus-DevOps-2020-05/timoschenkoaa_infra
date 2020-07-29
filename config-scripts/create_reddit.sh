yc compute instance create \
  --name from-image \
  --hostname from-image \
  --memory=4 \
  --create-boot-disk image-id='fd86k0bcvr8mne9nq16g',size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key /home/alexander/.ssh/appuser.pub \
  --zone ru-central1-a