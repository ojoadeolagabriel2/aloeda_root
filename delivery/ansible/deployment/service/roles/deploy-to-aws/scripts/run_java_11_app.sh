#!/bin/sh

JAR_NAME=${APP_JAR:-payment-gateway-feature.jar}
JAR_ENV=${APP_JAR_ENV:-PRODUCTION}

java -Xmx1g \
     -Xms1g \
     -Duser.timezone="Europe/London" \
     -Dspring.profiles.active=$JAR_ENV \
     "${JAR_NAME}"
