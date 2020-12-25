#!/bin/sh -xe

TEST_URL="${1:-http://host.docker.internal:8094/api/v1/merchant}" # url to load test
ITERATIONS="${2:-100}"                                            # number of iterations
CONCURRENT_REQUESTS="${3:-5}"                                     # number of current calls

ab -v 3 -n "$ITERATIONS" -c "$CONCURRENT_REQUESTS" "$TEST_URL" >/app/result.txt