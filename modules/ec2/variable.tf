variable "ami_id" {}

variable "instance_type" {
    default = "t3a.micro"
}

variable "ec2_count" {
    default = "1"
}

variable "subnet_id" {}

variable "sg_id" {}
