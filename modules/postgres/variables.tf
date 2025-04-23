variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "postgres_instance_type" {
  description = "Instance type for the PostgreSQL instance"
  type        = string
}

variable "postgres_ami" {
  description = "AMI ID for the PostgreSQL instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
}

variable "allowed_cidrs" {
  description = "List of allowed CIDRs to access the PostgreSQL instance"
  type        = list(string)
}

variable "environment" {
  description = "The environment for the deployment"
  type        = string
}

