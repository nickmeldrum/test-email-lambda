#!/bin/bash
set -e

cd ~/src/gdw/modules/advice-refresh-email-clerk
npm run compile
npm run package
aws lambda update-function-code --function-name nicholasmeldrum-public-AdviceRefreshEmailClerk --region eu-west-1 --zip-file fileb://target/advice-refresh-email-clerk.zip
cd -
