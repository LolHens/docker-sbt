FROM lolhens/baseimage-openjdk:latest
MAINTAINER LolHens <pierrekisters@gmail.com>


ENV SBT_VERSION 0.13.15
ENV SBT_NAME sbt
ENV SBT_FILE $SBT_NAME-$SBT_VERSION.tgz
ENV SBT_URL http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/$SBT_FILE
ENV SBT_HOME /usr/local/sbt

ENV JAVA_OPTS -Xmx2G


RUN cd "/tmp" \
 && curl -LO $SBT_URL \
 && tar -xf $SBT_FILE \
 && mv $SBT_NAME $SBT_HOME \
 && cleanimage
ENV sbt_home $SBT_HOME
ENV PATH $PATH:$SBT_HOME/bin


WORKDIR /root
