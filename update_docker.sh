#!/bin/sh

set -ex

apt-get update && apt-get -y install sudo
sudo apt-get -y install git rsync

ls -al

git clone docker-compose-deployment update-git

#cp -TR web-content update-git/web
rsync -avrh --delete web-content/ update-git/web

cd update-git

git config --global user.email "nayamama@hotmail.com"
git config --global user.name "Qi Yang"

git add .
git commit -m "new web content"
git push