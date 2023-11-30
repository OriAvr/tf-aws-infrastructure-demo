resource "aws_instance" "myec2" {
  ami           = "ami-024874535a12ff90b"
  instance_type = "t3.micro"
}
