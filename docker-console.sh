#!/bin/bash

# This command ensures the clock inside the docker container syncs with your local machine
# This prevents hits to the AWS SDK from rejecting due to clock sync issues
docker run --rm --privileged laradock_workspace nsenter -t 1 -m -u -n -i date -u $(date -u +%m%d%H%M%Y)

# Enter the workspace
docker compose exec workspace bash
