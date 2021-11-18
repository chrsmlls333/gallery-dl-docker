#!/usr/bin/env bash

docker run -it --rm \
-v $(pwd)/output:/output:rw \
--mount type=tmpfs,destination=/.downloads \
dev "${1}";