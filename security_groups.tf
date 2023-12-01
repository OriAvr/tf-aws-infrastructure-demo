resource "aws_security_group" "allow_inbound_public" {
  name        = "allow_http_ssh"
  description = "Allow incoming http and ssh traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allows incoming http"
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows incoming ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_security_group" "allow_inbound_outbound_private" {
  name        = "allow_inbound_outbound"
  description = "Allow incoming traffic from web server and outbound to database"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allows incoming http"
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allows incoming ssh"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_http_ssh"
  }
}
