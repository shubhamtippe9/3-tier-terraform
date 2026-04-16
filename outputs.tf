output "app_public_ip" {
  value = module.ec2.app_public_ip
}

output "db_private_ip" {
  value = module.ec2.db_private_ip
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}