output "app_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "db_private_ip" {
  value = aws_instance.db_client.private_ip
}