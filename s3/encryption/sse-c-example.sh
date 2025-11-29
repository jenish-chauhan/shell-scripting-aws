#!/bin/bash
BUCKET="my-bucket"
KEY="path/object.txt"
LOCALFILE="./localfile.txt"

# create key (if you want new one)
openssl rand 32 > sse_c_key.bin
sse_c_key_md5_b64=$(openssl dgst -md5 -binary sse_c_key.bin | base64)

# upload
aws s3api put-object \
  --bucket "$BUCKET" \
  --key "$KEY" \
  --body "$LOCALFILE" \
  --sse-customer-algorithm AES256 \
  --sse-customer-key fileb://sse_c_key.bin \
  --sse-customer-key-md5 "$sse_c_key_md5_b64"

# download (verify)
aws s3api get-object \
  --bucket "$BUCKET" \
  --key "$KEY" \
  --sse-customer-algorithm AES256 \
  --sse-customer-key fileb://sse_c_key.bin \
  downloaded-$LOCALFILE
