output "postgres_instance_id" {
  value = aws_instance.postgres.id
}

output "postgres_instance_public_ip" {
  value = aws_instance.postgres.public_ip
}

output "private_key" {
  value = tls_private_key.postgres_key.private_key_pem
}