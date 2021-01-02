FROM alpine

RUN apk add apache2-utils
WORKDIR /app
COPY run.sh run.sh

VOLUME /app/output

RUN ["chmod", "+x", "run.sh"]

ENTRYPOINT ["./run.sh"]
CMD ["http://host.docker.internal:8094/api/v1/merchant", "1000", "10"]
