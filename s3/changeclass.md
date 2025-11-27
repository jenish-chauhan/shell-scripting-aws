//create bucket

aws s3 mb s3://jenish-chauhan00987

//create file

echo "hello " > jenish.txt

aws s3 cp jenish.txt s3://jenish-chauhan00987 --storage-class STANDARD_IA

//REMOVE

aws s3 rm s3://jenish-chauhan00987/jenish.txt
aws s3 rb s3://jenish-chauhan00987
