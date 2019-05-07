#!/usr/bin/env bash

set -xeuo pipefail

env

for i in $(seq 20); do
    echo "Running without docker number ${i}"
    curl -iv https://repo1.maven.org/maven2/org/broadinstitute/gatk/4.1.2.0/gatk-4.1.2.0.pom.md5
    echo
    echo "Sleeping 10 seconds..."
    sleep 10
done

for i in $(seq 20); do
    echo "Running with docker number ${i}"
    docker run --rm -v $(pwd):/data/ openjdk:8u212 \
        curl --connect-timeout 1 -iv https://repo1.maven.org/maven2/org/broadinstitute/gatk/4.1.2.0/gatk-4.1.2.0.pom.md5
    echo
    echo "Sleeping 10 seconds..."
    sleep 10
done
