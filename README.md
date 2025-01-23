# terraform-aws
Terraform AWS project to deploy a working VPC architecture to deploy EC2 instances and shared DB instance.

## Create key for EC2 instance manually.
''' aws ec2 create-key-pair \
    --key-name my-ec2-key \
    --key-type rsa \
    --key-format pem \
    --query "KeyMaterial" \
    --output text > my-ec2-key.pem '''