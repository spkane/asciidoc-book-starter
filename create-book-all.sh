#!/usr/bin/env bash

set -euo pipefail

./create-book-pdf.sh
./create-book-epub.sh
./create-book-html.sh

exit 0
