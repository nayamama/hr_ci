#!/bin/sh

set -ex

apt-get update && apt-get -y install sudo
sudo apt-get -y install rsync openssh-client

touch private_key.pem
sudo chmod 600 private_key.pem

echo $PRIVATE_KEY | sed -e 's/\(KEY-----\)\s/\1\n/g; s/\s\(-----END\)/\n\1/g' | sed -e '2s/\s\+/\n/g' > private_key.pem
cat private_key.pem

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i private_key.pem root@shilei.mooo.com 'bash -s' < ci-code/deploy_ali.sh


