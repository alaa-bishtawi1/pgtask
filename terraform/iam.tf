data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:ListBucket", "s3:GetObject", "s3:PutObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.bucket_name}"]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3_bucket_access_policy"
  description = "A policy to control access to the specific S3 bucket"
  policy      = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2_s3_role"

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ],
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "s3_instance_profile" {
  name = "s3_instance_profile"
  role = aws_iam_role.ec2_s3_role.name
}

