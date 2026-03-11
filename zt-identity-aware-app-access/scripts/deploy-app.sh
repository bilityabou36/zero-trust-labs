#!/bin/bash

APP_URL="https://app.bilityzt.com"

echo "Testing identity-aware application access..."

curl -I $APP_URL

echo ""
echo "Expected Result:"
echo "HTTP/1.1 302 redirect to Cognito login"
echo ""
echo "If authenticated, user is forwarded to EC2 through ALB."
