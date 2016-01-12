FROM ubuntu:14.04

RUN apt-get update && \
apt-get install -y curl tar wget gettext-base openjdk-7-jdk

ENV DIST_VERSION 0.1.5

# Install Mesos base package for libs
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
echo deb http://repos.mesosphere.io/ubuntu trusty main > /etc/apt/sources.list.d/mesosphere.list && \
apt-get update && \
apt-get -y install mesos=0.26.0-0.2.145.ubuntu1404

COPY build/hdfs-mesos-0.1.5.tgz /hdfs/
RUN cd /hdfs && tar zxvf /hdfs/hdfs-mesos-$DIST_VERSION.tgz

WORKDIR /hdfs/hdfs-mesos-$DIST_VERSION

CMD /hdfs/hdfs-mesos-$DIST_VERSION/bin/hdfs-mesos
