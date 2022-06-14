#!/bin/bash
set -euo

export AWS_ACCESS_KEY_ID=UNSET
export AWS_SECRET_ACCESS_KEY=UNSET
export AWS_DEFAULT_REGION=eu-west-2

## make sure that localstack is running in the pipeline
until curl http://localstack:4566/health --silent | grep -q "\"sqs\": \"available\""; do
   sleep 5
   echo "Waiting for LocalStack to be ready..."
done

## Audit
awslocal sqs create-queue --queue-name audit-queue-dlq
awslocal sqs create-queue --queue-name audit-queue --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\": \"arn:aws:sqs:eu-west-2:000000000000:audit-queue-dlq\", \"maxReceiveCount\":1}", "VisibilityTimeout": "10"}'

## Casework
aws sqs --endpoint-url=http://localstack:4566 create-queue --queue-name notify-queue-dlq
aws sqs --endpoint-url=http://localstack:4566 create-queue --queue-name notify-queue --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-2:000000000000:notify-queue-dlq\",\"maxReceiveCount\":2}"}'

## Search
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name search-queue-dlq
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name search-queue --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-2:000000000000:search-queue-dlq\",\"maxReceiveCount\":2}"}'

## Docs
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name document-queue
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name document-queue-dlq

## Case Creator
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name ukvi-complaint-queue
aws --endpoint-url=http://localstack:4566 sqs create-queue --queue-name ukvi-complaint-queue-dlq

## Notify
aws sqs --endpoint-url=http://localstack:4566 create-queue --queue-name notify-queue-dlq
aws sqs --endpoint-url=http://localstack:4566 create-queue --queue-name notify-queue --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:eu-west-2:000000000000:notify-queue-dlq\",\"maxReceiveCount\":1}"}'

aws sqs --endpoint-url=http://localstack:4566 list-queues

## SNS Subscriptions
aws --endpoint-url=http://localstack:4566 sns create-topic --name hocs-audit-topic
aws --endpoint-url=http://localstack:4566 sns subscribe --topic-arn arn:aws:sns:eu-west-2:000000000000:hocs-audit-topic --attributes RawMessageDelivery=true --protocol sqs --notification-endpoint arn:aws:sns:eu-west-2:000000000000:audit-queue
aws --endpoint-url=http://localstack:4566 sns subscribe --topic-arn arn:aws:sns:eu-west-2:000000000000:hocs-audit-topic --attributes RawMessageDelivery=true --protocol sqs --notification-endpoint arn:aws:sns:eu-west-2:000000000000:search-queue
aws --endpoint-url=http://localstack:4566 sns set-subscription-attributes --subscription-arn $(aws --endpoint-url=http://localstack:4566 sns list-subscriptions-by-topic --topic-arn arn:aws:sns:eu-west-2:000000000000:hocs-audit-topic --output json | jq --raw-output '.Subscriptions[0].SubscriptionArn') --attribute-name RawMessageDelivery --attribute-value true
aws --endpoint-url=http://localstack:4566 sns set-subscription-attributes --subscription-arn $(aws --endpoint-url=http://localstack:4566 sns list-subscriptions-by-topic --topic-arn arn:aws:sns:eu-west-2:000000000000:hocs-audit-topic --output json | jq --raw-output '.Subscriptions[1].SubscriptionArn') --attribute-name RawMessageDelivery --attribute-value true

aws --endpoint-url=http://localstack:4566 sns list-subscriptions