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
  default     = "progineeeralaabishtawi1"
}

variable "keypair_name" {
  description = "Keypair name"
  default     = "Alaa public key"
}

variable "my_public_ip" {
  description = "My Public IP"
  default     = "46.43.83.87"
}
