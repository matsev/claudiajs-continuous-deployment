#!/usr/bin/env bash

# Updates the Lambda "prod" alias to point to the same version as the "stage" Lambda alias

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

./update-alias.sh prod stage
