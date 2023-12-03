resource "aws_security_group" "allow_inbound_public" {
  name        = "allow_http_ssh"
  description = "Allow incoming http and ssh traffic"
  vpc_id      = aws_vpc.terraform_demo_vpc.id

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
  vpc_id      = aws_vpc.terraform_demo_vpc.id

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

resource "aws_security_group" "allow_rds_inbound" {
  name        = "allow_inbound_rds"
  description = "Allow incoming traffic from application server"
  vpc_id      = aws_vpc.terraform_demo_vpc.id
  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group_rule" "allow_appserver_access" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.allow_inbound_outbound_private.id
  source_security_group_id = aws_security_group.allow_rds_inbound.id
}
resource "aws_security_group_rule" "allow_rds_access" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.allow_rds_inbound.id
  source_security_group_id = aws_security_group.allow_inbound_outbound_private.id
}
