variable "aws_cidr" {
    default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "dedicated"
}

variable "private_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "avail_zone" {
    default = "us-east-1a"
}
