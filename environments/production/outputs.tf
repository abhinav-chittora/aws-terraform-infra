output "web_app_public_ip" {
  value = module.ec2_instance.public_ip
}

output "web_app_dns_name" {
  value = module.alb.dns_name
}

output "postgres_instance_public_ip" {
  value = module.postgres_instance.public_ip
}

output "ssl_certificate_arn" {
  value = module.ssl_certificate.certificate_arn
}