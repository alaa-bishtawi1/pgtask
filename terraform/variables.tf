variable "region" {
  description = "AWS region"
  default     = "eu-central-1"
}

variable "ami" {
  description = "AMI for the EC2 instances"
  default     = "ami-0ab1a82de7ca5889c"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "S3 bucket name"
  default     = "alaa-bishtawi-progineer-task-bucket"
}


variable "my_public_ip" {
  description = "My Public IP"
  default     = "3.15.50.139"
}
