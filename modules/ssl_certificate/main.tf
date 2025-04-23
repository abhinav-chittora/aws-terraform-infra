resource "aws_acm_certificate" "ssl_certificate" {
  count             = var.create_new_certificate ? 1 : 0
  domain_name       = var.domain_name
  validation_method = "DNS"
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-ssl-certificate"
    }
  )
}

resource "aws_acm_certificate" "imported_ssl_certificate" {
  count             = var.create_new_certificate ? 0 : 1
  private_key       = file(var.private_key_path)
  certificate_body  = file(var.certificate_body_path)
  certificate_chain = file(var.certificate_chain_path)
  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-ssl-certificate"
    }
  )
}

# Only create validation resources if creating a new cert
resource "aws_route53_record" "certificate_validation" {
  count   = var.create_new_certificate ? 1 : 0
  for_each = var.create_new_certificate ? {
    for dvo in aws_acm_certificate.ssl_certificate[0].domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      value  = dvo.resource_record_value
    }
  } : {}
  zone_id = var.route53_zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.value]
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_acm_certificate.ssl_certificate]
}

resource "aws_acm_certificate_validation" "ssl_certificate_validation" {
  count            = var.create_new_certificate ? 1 : 0
  certificate_arn  = aws_acm_certificate.ssl_certificate[0].arn
  validation_record_fqdns = [
    for record in aws_route53_record.certificate_validation : record.fqdn
  ]
}

