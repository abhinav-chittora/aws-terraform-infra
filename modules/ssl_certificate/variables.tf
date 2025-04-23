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

variable "private_key_path" {
  description = "Path to the SSL certificate private key file"
  type        = string
}

variable "certificate_body_path" {
  description = "Path to the SSL certificate body file"
  type        = string
}

variable "certificate_chain_path" {
  description = "Path to the SSL certificate chain file"
  type        = string
}

variable "create_new_certificate" {
  description = "Whether to create a new ACM certificate (true) or import an existing one (false)"
  type        = bool
  default     = true
}