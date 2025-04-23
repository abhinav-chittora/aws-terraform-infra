variable "instance_type" {
  description = "EC2 instance type for the web application"
  default     = "t2.micro"
}

variable "db_instance_type" {
  description = "EC2 instance type for the PostgreSQL database"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the web application"
  default     = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for your region
}

variable "db_ami_id" {
  description = "AMI ID for the PostgreSQL database"
  default     = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID for your region
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate"
  type        = string
}

variable "db_username" {
  description = "Username for the PostgreSQL database"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "The environment for the deployment (e.g., production)"
  default     = "production"
}