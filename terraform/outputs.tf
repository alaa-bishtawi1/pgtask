output "db_instance_public_ip" {
  value = aws_instance.db_instance.public_ip
}

output "app_instance_public_ip" {
  value = aws_instance.app_instance.public_ip
}

output "db_instance_local_ip" {
  value = aws_instance.db_instance.private_ip
}

output "app_instance_local_ip" {
  value = aws_instance.app_instance.private_ip
}