output "certificate_arn" {
  value = var.create_new_certificate ? aws_acm_certificate.ssl_certificate[0].arn : aws_acm_certificate.imported_ssl_certificate[0].arn
}
