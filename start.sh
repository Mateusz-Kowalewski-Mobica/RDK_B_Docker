#!/bin/bash

CONTAINER_NAME="rdk-b_image"

sudo docker build -t $CONTAINER_NAME .
sudo docker run -v $(pwd)/data/myvolume:/home/build/RDK --name RDK_B_CONTAINER -d $CONTAINER_NAME 
sudo docker logs -f RDK_B_CONTAINER