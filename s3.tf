resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-test-bucket"


  tags = {
    Name        = "My bucket"
    Environment = "dev"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "example_ownership_control" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "acl_example" {
  depends_on = [aws_s3_bucket_ownership_controls.example_ownership_control]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}
