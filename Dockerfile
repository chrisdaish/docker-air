FROM centos:6.6

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV ADOBEAIRPACKAGE adobeair-2.6.0.rpm

RUN curl -sL https://drive.google.com/uc?export=download&id=0B502esw4L9MCdFhRZlBwZy0xOUU -o /tmp/$ADOBEAIRPACKAGE; \
    touch /usr/lib/libgnome-keyring-fake; \ 
    yum install --setopt=tsflags=nodocs -y  libstdc++.i686 \
                                            libstdc++.x86_64 \
                                            gtk2.i686 \
                                            nss.i686 \
                                            nss.x86_64 \
                                            rpm-libs.i686 \
                                            rpm-libs.x86_64 \
                                            /tmp/$ADOBEAIRPACKAGE; \
    yum clean all; \
    rm -rf /var/cache/yum; \
    rm -f /tmp/$ADOBEAIRPACKAGE
