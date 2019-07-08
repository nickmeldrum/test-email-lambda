#!/bin/bash

HASH=$(aws dynamodb scan --table-name nicholasmeldrum-sent-emails --region eu-west-1 --query "Items[*].contentHash.S" --output text)
aws dynamodb delete-item --table-name nicholasmeldrum-sent-emails --region eu-west-1 --key "{\"contentHash\": { \"S\": \"$HASH\" } }"
rm -f test-outfile
aws lambda invoke --function-name nicholasmeldrum-public-AdviceRefreshEmailClerk --payload file://input.json test-outfile --region eu-west-1
cat test-outfile

