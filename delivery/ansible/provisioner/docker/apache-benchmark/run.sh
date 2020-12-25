#!/bin/sh -xe

TEST_URL="${1:-http://host.docker.internal:8094/api/v1/merchant}"
ITERATIONS="${2:-1000}"
CONCURRENT_REQUESTS="${3:-10}"

ab -v 3 -n "$ITERATIONS" -c "$CONCURRENT_REQUESTS" "$TEST_URL" >/app/result.txt