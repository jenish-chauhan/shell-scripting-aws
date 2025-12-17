//create and copy image

aws ec2 create-image \
 --instance-id i-1234567890abcdef0 \
 --name "My server" \
 --description "An AMI for my server"

aws ec2 copy-image \
 --region us-east-1 \
 --name ami-name \
 --source-region us-west-2 \
 --source-image-id ami-066877671789bd71b \
 --description "This is my copied image."

#aws is also automatically create an snap shot of an AMI
