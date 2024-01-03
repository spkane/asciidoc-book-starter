#!/usr/bin/env bash

set -euo pipefail

# Docker image: https://hub.docker.com/r/asciidoctor/docker-asciidoctor
# Docker image repository: https://github.com/asciidoctor/docker-asciidoctor

# The directory where the book source is located
BOOK_SOURCE_DIR=book
# The directory where the book's generated output files will be created
BOOK_BUILD_DIR=build

rm -f build/*.html

docker run --rm -v "$(pwd):/documents/" asciidoctor/docker-asciidoctor \
  asciidoctor -D $BOOK_BUILD_DIR $BOOK_SOURCE_DIR/index.adoc
