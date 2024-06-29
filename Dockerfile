FROM ubuntu:22.04

ENV WORKSPACE=/workspace/RDK

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 git build-essential gettext bison libfile-slurp-perl gawk libncurses-dev autoconf \
  flex doxygen libtool automake   libpcre3-dev zlib1g-dev libbz2-dev subversion minicom putty libssl-dev rpm \
  vim tofrodos meld dos2unix cmake uuid-dev ruby transfig libglib2.0-dev liblz4-tool zstd \
  xutils-dev gperf autopoint curl vim diffstat texinfo chrpath openjdk-8-jre repo python2 cpio wget python-is-python3 locales locales-all \
  && rm -rf /var/lib/apt/lists/* \
  && git config --global user.name "Mateusz Kowalewski" \ 
  && git config --global user.email mateusz.kowalewski@cognizant.com

WORKDIR $WORKSPACE
COPY src/netrc /root/.netrc
RUN chmod 600 /root/.netrc

RUN  repo init -u https://code.rdkcentral.com/r/manifests -m rdkb-extsrc.xml -b kirkstone \
  && repo sync --no-clone-bundle

RUN groupadd build -g 1000
RUN useradd -ms /bin/bash -p build build -u 1028 -g 1000 && \
        usermod -aG sudo build && \
        echo "build:build" | chpasswd

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LANG en_US.utf8

COPY src/run.sh /
RUN chmod +x /run.sh
RUN chmod -R 777 $WORKSPACE

#RUN apt-get update && \
#      apt-get -y install sudo
USER build

ENTRYPOINT ["/run.sh"]
#RUN MACHINE=raspberrypi4-rdk-broadband . meta-cmf-raspberrypi/setup-environment

#RUN bitbake rdk-generic-broadband-image