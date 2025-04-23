locals{
  tags = {
    environment = var.environment
    application_name = "${var.application_name}"
    owner = "${var.owner}"
    created_by = "terraform"
    maintenance_window = "${var.maintenance_window}"
  }
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = local.tags
}

module "ssl_certificate" {
  source = "../../modules/ssl_certificate"
  domain_name = var.domain_name
  tags = local.tags
}

module "alb" {
  source = "../../modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = [module.vpc.public_subnet_id]
  ssl_certificate_arn = module.ssl_certificate.certificate_arn
  tags = local.tags
}

module "web_ec2" {
  source = "../../modules/ec2"
  ami = var.web_ami
  instance_type = var.web_instance_type
  security_group_id = aws_security_group.web_sg.id
  subnet_id = module.vpc.public_subnet_id
  alb_dns_name = module.alb.dns_name
  tags = local.tags
}

module "db_ec2" {
  source = "../../modules/postgres"
  postgres_ami = var.db_ami
  postgres_instance_type = var.db_instance_type
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.private_subnet_id
  allowed_cidrs = var.allowed_cidrs
  environment = var.environment
  tags = local.tags
}
