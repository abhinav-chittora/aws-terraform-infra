variable "aws_region" {
  description = "AWS region for the deployment"
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS profile for the deployment"
  default     = "default"
}

variable "private_key_path" {
  description = "Path to the private key for the SSL certificate"
  default     = "../../secrets/key_nopass.pem" # Replace with your private key path
}

variable "certificate_body_path" {
  description = "Path to the certificate body for the SSL certificate"
  default     = "../../secrets/cert.pem" # Replace with your certificate body path
}

variable "certificate_chain_path" {
  description = "value to the certificate chain for the SSL certificate"
  default     = "../../secrets/cert.pem" # Replace with your certificate chain path
}

variable "create_new_certificate" {
  description = "Flag to create a new SSL certificate"
  default     = false
}
variable "domain_name" {
  description = "Domain name for the web application"
  default     = "hws-gruppe.de" # Replace with your domain
}

variable "environment" {
  description = "The environment for the deployment"
  default     = "development" # Replace with your desired environment name
}

variable "instance_type" {
  description = "EC2 instance type for the web application"
  default     = "t2.micro"
}

variable "ssh_allowed_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into the instance"
  default     = ["151.189.180.250/32"] # replace with your IP address
}
variable "db_instance_type" {
  description = "EC2 instance type for the PostgreSQL database"
  default     = "t2.micro"
}

variable "web_app_ami" {
  description = "AMI ID for the web application EC2 instance"
  default     = "ami-0d8d11821a1c1678b" # Example AMI ID, replace with a valid one
}

variable "postgres_ami" {
  description = "AMI ID for the PostgreSQL EC2 instance"
  default     = "ami-0d8d11821a1c1678b" # Example AMI ID, replace with a valid one
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  default     = 2
}


variable "public_subnet_cidrs" {
  description = "CIDR block for the public subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR block for the private subnet"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "ssl_certificate_domain" {
  description = "Domain name for the SSL certificate"
  default     = "example.com" # Replace with your domain
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID"
  default     = "Z3P5QSUBK4A8V2" # Replace with your Route 53 hosted zone ID
}

variable "db_name" {
  description = "Name of the PostgreSQL database"
  default     = "mydatabase"
}

variable "db_user" {
  description = "Username for the PostgreSQL database"
  default     = "dbuser"
}

variable "db_password" {
  description = "Password for the PostgreSQL database"
  default     = "dbpassword" # Replace with a secure password
}
