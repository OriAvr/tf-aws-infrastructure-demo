resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id // to be replaced with the vpc's actual name

  tags = {
    Name = "terraform-demo-vpc-internet-gateway"
  }
}
