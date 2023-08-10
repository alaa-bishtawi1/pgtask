# it was aws_s3_bucket
# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.bucket_name
#   acl    = "private"
# }

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

# resource "aws_s3_bucket_acl" "my_bucket" {
#   bucket = aws_s3_bucket.my_bucket.id
#   acl    = "private"
# }

