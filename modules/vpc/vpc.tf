resource "aws_vpc" "main" {
  cidr_block = var.aws_cidr
  instance_tenancy =var.tenancy
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.avail_zone
}

resource "aws_route_table" "main" {
    vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "main-private" {
    subnet_id = aws_subnet.main.id
    route_table_id = aws_route_table.main.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_sg"
  description = "Allow SSH inbound connections"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}
