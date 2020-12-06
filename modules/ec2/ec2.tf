resource "aws_instance" "test" {
  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name = "test-key"
}

resource "aws_key_pair" "testkey" {
  key_name   = "test-key"
  public_key = "<ssh-keygen>"
}
