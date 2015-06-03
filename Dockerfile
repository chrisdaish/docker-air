FROM ubuntu:14.04.2

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV ADOBEAIRPACKAGE adobeair_2.6.0.19170-devolo1_i386.deb

RUN dpkg --add-architecture i386; \
    apt-get update; \
    apt-get install --no-install-recommends -y  wget \
                                                lzma \
                                                xz-utils \
                                                libgtk2.0-0:i386 \
                                                libxslt1.1:i386 \
                                                libxml2:i386 \
                                                libnss3:i386 \
                                                libxaw7:i386; \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet http://update.devolo.com/linux/apt/pool/main/a/adobeair/$ADOBEAIRPACKAGE  -O /tmp/$ADOBEAIRPACKAGE; \
    dpkg -i /tmp/$ADOBEAIRPACKAGE; \
    rm /tmp/$ADOBEAIRPACKAGE
