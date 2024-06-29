#!/bin/bash

CONTAINER_NAME="rdk-b_image"

sudo docker build -t $CONTAINER_NAME .
sudo docker run --name test -d $CONTAINER_NAME
sudo docker logs -f test