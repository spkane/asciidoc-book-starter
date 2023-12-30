#!/usr/bin/env bash

set -euo pipefail

./create-book-pdf.sh
./create-book-epub.sh

exit 0
