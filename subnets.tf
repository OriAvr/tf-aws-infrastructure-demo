resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.terraform_demo_vpc.id
  cidr_block = "10.0.0.0/24" // to be replaced with variable

  tags = {
    Name = "public-subnet"
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.terraform_demo_vpc.id
  cidr_block = "10.0.1.0/24" // to be replaced with variable

  tags = {
    Name = "private-subnet"
  }
}
