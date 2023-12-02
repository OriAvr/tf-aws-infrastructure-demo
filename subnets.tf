resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.terraform_demo_vpc.id
  cidr_block = var.public_vpc

  tags = {
    Name = "public-subnet"
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.terraform_demo_vpc.id
  cidr_block = var.private_vpc

  tags = {
    Name = "private-subnet"
  }
}
