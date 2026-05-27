output "app_public_ips" {
  value = aws_instance.app[*].public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "backup_bucket_name" {
  value = aws_s3_bucket.backups.bucket
}

