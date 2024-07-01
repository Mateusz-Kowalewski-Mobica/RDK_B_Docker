# Description
Simply docker container environment for building RDK-B Yocto distribution for RaspberryPi 4

# Setup
Initialize RDK-B Repository (you need to update you netrc file)

```
source init.sh
```

# Run
To run building docker image and run container simply use:
```
source start.sh
```

Output image will be saved in /data/myvolume/build-raspberrypi4-rdk-broadband/tmp/deploy/images/raspberrypi4-rdk-broadband

