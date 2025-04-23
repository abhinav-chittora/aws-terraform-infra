variable "environment" {
  description = "The environment for the resources (development or production)"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the load balancer will be created"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the load balancer"
  type        = list(string)
}

variable "certificate_arn" {
  description = "The ARN of the SSL certificate"
  type        = string
}

variable "ec2_instance_id" {
  description = "The ID of the EC2 instance to attach to the target group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}