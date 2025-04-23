output "web_app_public_ip" {
  value = aws_instance.web_app.public_ip
}

output "ec2_instance_id" {
  value = aws_instance.web_app.id
}

output "private_key" {  
  value = tls_private_key.ssh_key.private_key_pem  
}