FROM lolhens/baseimage-openjdk:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV SBT_VERSION 1.1.5
ENV SBT_NAME sbt
ENV SBT_FILE $SBT_NAME-$SBT_VERSION.tgz
ENV SBT_URL https://sbt-downloads.cdnedge.bluemix.net/releases/v$SBT_VERSION/$SBT_FILE
ENV SBT_HOME /usr/local/sbt

ENV JAVA_OPTS -Xmx2G


RUN cd "/tmp" \
 && curl -LO $SBT_URL \
 && tar -xf $SBT_FILE \
 && mv $SBT_NAME $SBT_HOME \
 && cleanimage
ENV PATH $PATH:$SBT_HOME/bin


WORKDIR /root

RUN sbt tasks
