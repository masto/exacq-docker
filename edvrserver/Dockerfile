# Ubuntu 18.04 LTS
FROM ubuntu:18.04

ENV exacq_version=20.03.8.0

ARG DEBIAN_FRONTEND=noninteractive

# Temporarily install wget
RUN apt-get update \
    && apt-get install -y wget

# Download the software package from Exacq
ARG edvrserver_dpkg=exacqVisionServer_${exacq_version}_x64.deb
RUN wget --quiet http://exacq.com/reseller/20.03/${edvrserver_dpkg}

# Don't need this any more
RUN apt-get purge -y wget

# Prerequisites for edvrserver
RUN apt-get update \
    && apt-get install -y file ntp ntpdate net-tools smartmontools wodim

RUN dpkg -i ${edvrserver_dpkg} \
    && rm -f ${edvrserver_dpkg}

# Slim down the image
RUN apt-get autoremove -y && apt-get clean -y

EXPOSE 22609
ENTRYPOINT ["/usr/local/exacq/server/exacqd"]
