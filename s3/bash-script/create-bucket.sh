#!/usr/bin/env bash
# This script creates an S3 bucket in AWS.

echo "=== Create bucket ==="

# Check for the bucket name
if [ -z "$1" ]; then
  echo "Bucket name not provided. Usage: ./create-bucket.sh <bucket-name>"
  exit 1
fi

Bucket_name=$1

# Create the bucket (replace us-east-1 if needed)
aws s3api create-bucket \
  --bucket "$Bucket_name" \
  
  --query Location \
  --output text

echo "Bucket '$Bucket_name' created successfully."
