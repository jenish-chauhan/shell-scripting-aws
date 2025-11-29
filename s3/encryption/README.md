//create bucket

aws s3 mb s3://jenish-chauhan-0088

//put with encryption

aws s3api put-bucket-encryption `--bucket jenish-chauhan-0088`
--server-side-encryption-configuration file://jenish.json
