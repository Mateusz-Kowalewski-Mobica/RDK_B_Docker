#!/bin/bash

mkdir -p data/myvolume
pushd data/myvolume
    repo init -u https://code.rdkcentral.com/r/manifests -m rdkb-extsrc.xml -b kirkstone && repo sync -j`nproc` --no-clone-bundle
popd

sudo chown -R :1024 data/myvolume
chmod 775 data/myvolume
chmod g+s data/myvolume