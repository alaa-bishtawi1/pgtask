output "db_instance_ip" {
  value = aws_instance.db_instance.public_ip
}

output "app_instance_ip" {
  value = aws_instance.app_instance.public_ip
}
