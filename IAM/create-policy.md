aws iam create-policy --policy-name MyS3OnlyPolicy `
--policy-document file://C:\Users\erjen\Desktop\aws_cli\IAM\policy.json

//delete this policy

aws iam delete-policy `
--policy-arn arn:aws:iam::921027693349:policy/MyS3OnlyPolicy
