#!/bin/bash

set -e

fly -t tutorial set-pipeline -p hello-world -c hello-world.yml

# pipelines are paused when first created
fly -t tutorial unpause-pipeline -p hello-world
