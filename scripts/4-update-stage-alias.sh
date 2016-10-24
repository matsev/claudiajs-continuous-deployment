#!/usr/bin/env bash

# Updates the Lambda "stage" alias to point to the same version as the "latest" Lambda alias

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

./update-alias.sh stage latest
