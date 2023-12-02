resource "aws_instance" "public_subnet_ec2" {
  ami                    = "ami-024874535a12ff90b"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_inbound_outbound_private.id]
}

resource "aws_instance" "private_subnet_ec2" {
  ami                    = "ami-024874535a12ff90b"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_inbound_outbound_private.id]
}
