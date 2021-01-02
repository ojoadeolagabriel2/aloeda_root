FROM openjdk:8-jre-alpine

LABEL maintainer="adeola ojo <ojoadeolagabriel@gmail.com>"

ENV WIREMOCK_VERSION 2.27.0

RUN apk add --update openssl
RUN apk add --update libc6-compat
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2
RUN apk add --no-cache 'su-exec>=0.2' bash

RUN mkdir -p /var/wiremock/lib/ \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$WIREMOCK_VERSION/wiremock-standalone-$WIREMOCK_VERSION.jar \
    -O /var/wiremock/lib/wiremock-standalone.jar

WORKDIR /home/wiremock

COPY docker-entrypoint.sh /
COPY libs/wiremock-velocity-transformer-standalone-2.3.jar /var/wiremock/extensions/
RUN chmod +x /docker-entrypoint.sh

VOLUME /home/wiremock

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD java $JAVA_OPTS -cp /var/wiremock/lib/wiremock-standalone.jar:/var/wiremock/extensions/wiremock-velocity-transformer-standalone-2.3.jar \
    com.github.tomakehurst.wiremock.standalone.WireMockServerRunner --verbose -global-response-templating