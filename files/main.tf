module "my_vpc" {
 source ="/home/maithley/Downloads/terraform/modules/vpc"
 aws_cidr = "192.168.0.0/16"
 tenancy = "default"
 private_subnet_cidr = "192.168.1.0/24"
 avail_zone = "us-east-1b"

}

module "my_ec2"{
source ="/home/maithley/Downloads/terraform/modules/ec2"
ec2_count =  1
instance_type = "t3a.micro"
ami_id= "ami-04d29b6f966df1537"
subnet_id = module.my_vpc.subnet_id
sg_id = module.my_vpc.sg_id
}
