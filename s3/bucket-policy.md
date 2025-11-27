//make bucket

aws s3 mb s3://jenish-chauhan-2005

//bucket policy

aws s3 put-bucket-policy --bucket jenish-chauhan-2005 --policy file://policy.json
