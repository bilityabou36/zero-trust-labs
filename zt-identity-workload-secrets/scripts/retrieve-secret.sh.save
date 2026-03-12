#!/bin/bash

SECRET_ID="zt-db-secret"

echo "Retrieving secret from AWS Secrets Manager..."

aws secretsmanager get-secret-value \
  --secret-id "$SECRET_ID" \
  --query SecretString \
  --output text

