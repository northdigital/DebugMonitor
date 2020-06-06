FROM node:stretch-slim AS build-env

RUN apt update 
RUN apt upgrade 
RUN apt install nano

WORKDIR /DebugMonitor

COPY ./monitor.js .
COPY ./package.json .
COPY ./run.sh .

RUN chmod 777 run.sh

COPY ./node_modules ./node_modules

RUN mkdir scripts
COPY ./scripts ./scripts

VOLUME ["/vol"]
EXPOSE 4321
ENV TZ=UTC
ENV PATH=$PATH:/DebugMonitor

# ENTRYPOINT [ "npm", "start" ]
ENTRYPOINT [ "bash" ]
