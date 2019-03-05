FROM reishin/ambari-build-sandbox:jdk11
MAINTAINER hapy.lestat@gmail.com

STOPSIGNAL SIGRTMIN+3

ARG MONGODB_URL

ENV MONGODB_URL=$MONGODB_URL
ENV PROJECT_DIR /root/project
ENV SANDBOX=/var/lib/sandbox

RUN  mkdir /root/.ssh

COPY build_container/keys/config /root/.ssh/config
COPY build_container/keys/known_hosts /root/.ssh/known_hosts
RUN  chmod -R 400 /root/.ssh/

RUN  pip3 install pymongo
RUN  curl -o /usr/bin/storage https://raw.githubusercontent.com/hapylestat/storage/master/src/storage.py
RUN  chmod +x /usr/bin/storage

COPY build_container/sandbox/shell ${SANDBOX}/shell
COPY build_container/sandbox/lib/shell-functions ${SANDBOX}/lib/shell-functions
RUN chmod +x ${SANDBOX}/shell
