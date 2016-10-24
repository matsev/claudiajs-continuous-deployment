#!/usr/bin/env bash

# Updates the "latest" version of the API Gateway stage and the "latest" Lambda alias

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$script_dir/.."

npm install
npm run update-latest
