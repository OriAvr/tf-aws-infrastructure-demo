resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform_demo_vpc.id

  tags = {
    Name = "terraform-demo-vpc-internet-gateway"
  }
}
