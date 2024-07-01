FROM ubuntu:22.04

ENV WORKSPACE=/home/build/RDK

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 git build-essential gettext bison libfile-slurp-perl gawk libncurses-dev autoconf \
  flex doxygen libtool automake   libpcre3-dev zlib1g-dev libbz2-dev subversion minicom putty libssl-dev rpm \
  vim tofrodos meld dos2unix cmake uuid-dev ruby transfig libglib2.0-dev liblz4-tool zstd \
  xutils-dev gperf autopoint curl vim diffstat texinfo chrpath openjdk-8-jre repo python2 cpio wget python-is-python3 locales locales-all \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd build -g 1024 && \
  useradd -ms /bin/bash -p build build -u 1024 -g 1024 && \
  usermod -aG sudo build && \
  echo "build:build" | chpasswd

WORKDIR $WORKSPACE
COPY src/run.sh /home/build/
RUN chmod 600 /root/.netrc && chmod +x /home/build/run.sh

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LANG en_US.utf8

USER build

ENTRYPOINT ["/home/build/run.sh"]
