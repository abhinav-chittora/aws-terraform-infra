output "web_app_public_ip" {
  value = module.web_app.web_app_public_ip
}

output "load_balancer_dns" {
  value = module.alb.dns_name
}

output "ssl_certificate_arn" {
  value = module.ssl_certificate.certificate_arn
}

output "private_key" {
  value       = module.web_app.private_key
  description = "Private key for SSH access to the web app instance"
  # Marking the private key as sensitive to avoid exposing it in logs
  sensitive = true
}

output "postgres_private_key" {
  value       = module.postgres.private_key
  description = "Private key for SSH access to the PostgreSQL instance"
  # Marking the private key as sensitive to avoid exposing it in logs
  sensitive = true
}
