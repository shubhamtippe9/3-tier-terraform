variable "subnet_ids" {
  description = "List of subnet IDs for RDS"
  type        = list(string)
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}