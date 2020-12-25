FROM alpine

RUN apk add apache2-utils

WORKDIR /app

COPY run.sh run.sh

RUN ["chmod", "+x", "run.sh"]

ENTRYPOINT ["/app/run.sh"]

CMD ["http://nowhere:9999:/replace", "1000", "10"]
