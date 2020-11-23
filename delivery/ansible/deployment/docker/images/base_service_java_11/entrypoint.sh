#!/usr/bin/env bash

## The entrypoint is responsible for setting up all the JAVA_OPTS that this service will run with
set -e

if [ -z "$SERVICE_JAR_FILE" ]; then
    echo >&2 'error: $SERVICE_JAR_FILE must be set'
    exit 1
fi

GC_OPTS=""
if [ "$JVM_GC_TYPE" == "CMS" ]; then
    GC_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=68 -XX:+UseCMSInitiatingOccupancyOnly"
fi
if [ "$JVM_GC_TYPE" == "G1" ]; then
    GC_OPTS="-XX:+UseG1GC"
fi
if [ "$JVM_GC_TYPE" == "ZGC" ]; then
    GC_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseZGC"
fi

DEBUG_OPTS=""

if [ "$JVM_DEBUG_ENABLED" == "true" ]; then
    DEBUG_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
fi

LOGBACK_OPTS="$LOGBACK_OPTS \
-Dlogback.level=$LOGBACK_LEVEL \
-Dlogback.appender=$LOGBACK_APPENDER \
-Dlogback.appender.filePath=$LOGBACK_APPENDER_FILE_PATH \
-Dlogback.appender.maxFileSize=$LOGBACK_APPENDER_MAX_FILE_SIZE \
-Dlogback.appender.maxHistory=$LOGBACK_APPENDER_MAX_HISTORY \
-Dlogback.appender.totalSizeCap=$LOGBACK_APPENDER_TOTAL_SIZE_CAP \
"

exec ${JAVA_HOME}/bin/java \
$GC_OPTS \
$DEBUG_OPTS \
$JVM_ARGS \
$LOGBACK_OPTS \
-Xss$THREAD_STACK_SIZE \
-Xmx$MEMORY_ALLOCATION_POOL_MAX_SIZE \
-Xms$MEMORY_ALLOCATION_POOL_INITIAL_SIZE \
-Xlog:gc=debug,age=debug:file=/opt/service/log/gc.log \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:HeapDumpPath=/opt/service/log \
-Dfile.encoding=UTF-8 \
-jar $SERVICE_JAR_FILE \
"$@"
