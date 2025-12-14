//create bucket 

aws s3 mb s3://source-bucket-043434301
aws s3 mb s3://desti-bucket-002


//create file
touch hello.txt
aws s3 cp .\hello.txt s3://source-bucket-043434301