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

resource "aws_s3_bucket_policy" "allow_access_from_private_subnet" {
  bucket = aws_s3_bucket.my_bucket.arn
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::/*"
      ],
      "Effect": "Allow",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "10.0.1.0/24"
        }
      }
    }
  ]
}
POLICY

}
