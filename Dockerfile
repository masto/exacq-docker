# Ubuntu 18.04 LTS
FROM ubuntu:18.04

ENV exacq_version=20.03.8.0

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget file ntp ntpdate net-tools smartmontools wodim

ARG edvrserver_dpkg=exacqVisionServer_${exacq_version}_x64.deb
RUN wget --quiet http://exacq.com/reseller/20.03/${edvrserver_dpkg}
RUN dpkg -i ${edvrserver_dpkg} \
    && rm -f ${edvrserver_dpkg}

EXPOSE 22609
ENTRYPOINT ["/usr/local/exacq/server/exacqd"]
