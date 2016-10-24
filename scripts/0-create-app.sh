#!/usr/bin/env bash

# Creates the application, i.e. an API Gateway with two stages, named "stage" and "prod", that acts as an AWS Lambda proxy.
# The AWS Lambda function in turn has two alias, "stage" and "prod", that are associated with the API Gateway stages.

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$script_dir/.."

npm install
npm run create-app
npm run update-stage
npm run update-prod
