#!/bin/bash

aws ec2 create-vpc --cidr-block 172.11.0.0/24 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=MyVPC}]'
VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=MyVPC" --query "Vpcs[0].VpcId" --output text)
echo "Created VPC with ID: $VPC_ID"

#create internet gateway
aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=MyIGW}]'
IGW_ID=$(aws ec2 describe-internet-gateways --filters "Name=tag:Name,Values=MyIGW" --query "InternetGateways[0].InternetGatewayId" --output text)
echo "Created Internet Gateway with ID: $IGW_ID"

#attach internet gateway to vpc
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
echo "Attached Internet Gateway $IGW_ID to VPC $VPC_ID"

#create subnet
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 172.11.0.0/26 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=MySubnet-01}]'
SUBNET_ID=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=MySubnet-01" --query "Subnets[0].SubnetId" --output text)
echo "Created Subnet with ID: $SUBNET_ID" 

aws ec2 modify-subnet-attribute --subnet-id $SUBNET_ID --map-public-ip-on-launch
echo "Enabled auto-assign public IP on launch for Subnet $SUBNET_ID"

#create route table
aws ec2 create-route-table --vpc-id $VPC_ID --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=MyRouteTable}]'
RTB_ID=$(aws ec2 describe-route-tables --filters "Name=tag:Name,Values=MyRouteTable" --query "RouteTables[0].RouteTableId" --output text)
echo "Created Route Table with ID: $RTB_ID"

#create route to internet gateway
aws ec2 create-route --route-table-id $RTB_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
echo "Created route to Internet Gateway $IGW_ID in Route Table $RTB_ID"

#associate route table with subnet
aws ec2 associate-route-table --route-table-id $RTB_ID --subnet-id $SUBNET_ID
echo "Associated Route Table $RTB_ID with Subnet $SUBNET_ID"

#enable auto-assign public IP on launch for subnet




