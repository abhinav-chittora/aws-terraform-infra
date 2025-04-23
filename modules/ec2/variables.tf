variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "web_app_ami" {
  description = "AMI ID for the web application"
  type        = string
}

variable "web_app_instance_type" {
  description = "Instance type for the web application"
  type        = string
}

variable "environment" {
  description = "The environment for the deployment"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the security group"
  type        = string
}