//create a iam user
aws iam create-user --user-name Bob

//create access-key and secreat key
aws iam create-access-key --user-name jenish-chauhan02 --output table

//edit credentials file to change away from default profile
aws configure

//test who you are
=> aws sts get-caller-identit

//make sure you don't have access to any aws resouces
check => aws s3 ls

// assume a role with with the aws simple tocken service

// attch that role to the user
