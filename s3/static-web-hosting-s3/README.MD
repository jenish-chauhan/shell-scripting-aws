///create bucket

aws s3 mb s3://jenish07-chauhan

//enable public acces
aws s3api put-public-access-block --bucket jenish07-chauhan --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

//enable static website
aws s3api put-bucket-website --bucket jenish07-chauhan --website-configuration file://website.json

//allow bucket access by using the bucket policy

# if you created policy.json locally

aws s3api put-bucket-policy --bucket jenish07-chauhan --policy file://policy.json

//website url formate
http://<bucket-name>.s3-website-us-east-1.amazonaws.com

//remove all things
aws s3 rm s3://jenish07-chauhan/index.html

aws s3 rb s3://jenish07-chauhan
