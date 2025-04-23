resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-ssl-certificate"
    }
  )
}

resource "aws_route53_record" "certificate_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      value  = dvo.resource_record_value
    }
  }
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
  certificate_arn = aws_acm_certificate.ssl_certificate.arn

  validation_record_fqdns = [
    for record in aws_route53_record.certificate_validation : record.fqdn
  ]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "domain_name" {
  description = "Domain name for the SSL certificate"
  type        = string
}

variable "environment" {
  description = "The environment for the deployment"
  type        = string
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID for the domain"
  type        = string
}

output "certificate_arn" {
  value = aws_acm_certificate.ssl_certificate.arn
}
