FROM alpine:3.8

LABEL maintainer="PlayerServicesMember@gamesys.co.uk"

RUN apk add --update \
    curl \
    git \
    python-dev \
    py-pip \
    py-setuptools \
    build-base \
    gcc \
    ansible \
    tree \
    bash \
    docker \
    ca-certificates \
    jq \
    coreutils \
    openssh \
    libc6-compat \
    zip \
    tzdata

RUN apk add --no-cache nss

# Install docker-compose
RUN pip install 'docker-compose==1.12.0'

RUN apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

# Install mvn
RUN apk add --update \
    openjdk11-jre \
    openjdk11\
    maven

COPY files/id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN mkdir /usr/bin/member-ci
VOLUME ["/usr/bin/member-ci/external-project"]
WORKDIR /usr/bin/member-ci

# install j-frog
RUN curl -fL https://getcli.jfrog.io | sh