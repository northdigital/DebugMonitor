FROM debian AS build-env 

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y --no-install-recommends apt-utils

ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get install nano -y && apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /DebugMonitor

RUN mkdir scripts
COPY ./scripts ./scripts

COPY ./node_modules ./node_modules

COPY ./monitor.js .
COPY ./package.json .

COPY ./run.sh .
RUN chmod 777 run.sh

VOLUME ["/vol"]
EXPOSE 4321
ENV TZ=UTC
ENV PATH=$PATH:/DebugMonitor

ENTRYPOINT [ "bash", "run.sh" ]
