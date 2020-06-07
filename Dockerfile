FROM debian AS build-env 

RUN apt update -y && apt upgrade -y

RUN apt install nano -y &&  apt install curl -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get install -y nodejs

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

# ENTRYPOINT [ "bash", "run.sh" ]
ENTRYPOINT [ "bash" ]
