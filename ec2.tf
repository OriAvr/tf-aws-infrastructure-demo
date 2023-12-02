data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "public_subnet_ec2" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_inbound_outbound_private.id]
}

resource "aws_instance" "private_subnet_ec2" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_inbound_outbound_private.id]
}

