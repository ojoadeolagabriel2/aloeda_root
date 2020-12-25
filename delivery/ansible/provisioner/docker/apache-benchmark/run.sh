#!/bin/sh

set -xe

TEST_URL="${1:-http://host.docker.internal:8094/api/v1/merchant}" # url to load test
ITERATIONS="${2:-100}"                                            # number of iterations
CONCURRENT_REQUESTS="${3:-5}"                                     # number of current calls

ab -v 4 -c "$CONCURRENT_REQUESTS" -n "$ITERATIONS" "$TEST_URL" > /app/output/result.txt
cat /app/output/result.txt