#!/bin/bash

RDK_WORKSPACE="/workspace/RDK"

pushd $RDK_WORKSPACE
    MACHINE=raspberrypi4-rdk-broadband source meta-cmf-raspberrypi/setup-environment
    bitbake rdk-generic-broadband-image
popd
