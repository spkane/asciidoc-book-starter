#!/usr/bin/env bash

set -euo pipefail

# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

docker run -it -v "$(pwd)/book:/documents/" asciidoctor/docker-asciidoctor
