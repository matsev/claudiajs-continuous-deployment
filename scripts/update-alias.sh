#!/usr/bin/env bash

# Updates a Lambda alias to point to another existing specified Lambda version
#
# Usage:
#   update-alias.sh alias existing_alias

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$script_dir/.."

alias=$1
existing_alias=$2

lambda_name=$(cat claudia.json | jq -r ".lambda.name")
aws_region=$(cat claudia.json | jq -r ".lambda.region")

lambda_version=$(aws lambda list-aliases --function-name "$lambda_name" --region "$aws_region" --output json | \
    jq -r ".Aliases[] | select(.Name == \"$existing_alias\").FunctionVersion")

if [ "$lambda_version" == "\$LATEST" ]; then
    # Need to find out which
    versions=$(aws lambda list-versions-by-function --function-name "$lambda_name" --region "$aws_region" --output json)
    latest_sha=$(echo $versions | jq -r ".Versions[] | select(.Version == \"\$LATEST\").CodeSha256")
    lambda_version=$(echo $versions | jq --arg latestSha "$latest_sha" -r ".Versions[] | select(.Version != \"\$LATEST\") | select(.CodeSha256 == \"$latest_sha\").Version" )
fi

# Update existing alias to point to the Lambda version
echo "Updating alias '$alias' for Lambda '$lambda_name' to version '$lambda_version'"
aws lambda update-alias --function-name $lambda_name --name $alias --function-version $lambda_version --region $aws_region
