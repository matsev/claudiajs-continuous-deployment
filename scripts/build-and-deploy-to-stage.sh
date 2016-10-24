#!/usr/bin/env bash

# Helper scripts that tests, executes Lambda itests, updates Lambda alias, etc...

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

echo -e "\n==================== Execute Unit Tests ====================================\n"
./1-test.sh

echo -e "\n==================== Update Latest Version =================================\n"
./2-update-latest.sh

echo -e "\n==================== Execute Lambda Integration Tests ======================\n"
./3-lambda-itest.sh

echo -e "\n==================== Update "stage" Lambda Alias ===========================\n"
./4-update-stage-alias.sh

echo -e "\n==================== Execute API Gateway Integration Tests =================\n"
./5-api-gateway-itest.sh
