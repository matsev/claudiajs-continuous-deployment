# Continuous Deployment for Claudia.js

Sample project that shows how a set of bash scripts can be used to implement a continuous deployment pipeline for a 
[Claudia.js](https://claudiajs.com/) project.

Please read the [blog post]() for details.



## Tools

In order to execute the scripts, you need to install the following tools:

- [AWS CLI](https://aws.amazon.com/cli/) (AWS Command Line Interface)
- [npm](https://www.npmjs.com/) (JavaScript package manager)
- [jq](https://stedolan.github.io/jq/) (JSON Command Line Processor)


## Scripts

| Script                                                                | Description                                                           |
| ----------------------------------------------------------------------| --------------------------------------------------------------------- |
| [0-create-stack.sh](scripts/0-create-stack.sh)                        | Creates the stack                                                     |
| [1-test.sh](scripts/1-test.sh)                                        | Executes unit tests                                                   |
| [2-update-latest.sh](scripts/2-update-latest.sh)                      | Updates the `latest` version of the Lambda and API Gateway            |
| [3-lambda-itest.sh](scripts/3-lambda-itest.sh)                        | Executes Lambda integration tests                                     |
| [4-update-stage-alias.sh](scripts/4-update-stage-alias.sh)            | Updates the Lambda `stage` alias                                      |
| [5-api-gateway-itest.sh](scripts/5-api-gateway-itest.sh)              | Executes API Gateway integration tests (against the stage `stage`)    |
| [6-update-prod-alias.sh](scripts/6-update-prod-alias.sh)              | Updates the Lambda `prod` alias                                       |
| [build-and-deploy-to-stage.sh](scripts/build-and-deploy-to-stage.sh)  | Build pipeline script                                                 | 
| [update-alias.sh](scripts/update-alias.sh)                            | Support script used by other scripts                                  |

