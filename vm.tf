resource "aws-key-name" "key" {
  key_name   = "aws-key"
  public_key = file(aws-key.pub)

}

resource "aws_instance" "vm" {
  ami                         = "asd"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.name
  subnet_id                   = data.terraform_remote_state.vpc.output.subnet_id
  vpc_security_group_ids      = [date.terraform_remote_state.vpc.output.vpc_security_group_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "vm-terraform"
  }

}