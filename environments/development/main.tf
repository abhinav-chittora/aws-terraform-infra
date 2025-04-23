locals {
  tags = {
    environment        = var.environment
    application_name   = "MyTestApp"
    owner              = "Abhinav Chittora"
    created_by         = "terraform"
    maintenance_window = "Sun:02:00-Sun:03:00"
  }
}

module "vpc" {
  source = "../../modules/vpc"
  tags = local.tags
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnet_count = var.public_subnet_count
  public_subnet_cidrs = var.public_subnet_cidrs
    
  private_subnet_count = var.private_subnet_count
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones

}

module "ssl_certificate" {
  source                 = "../../modules/ssl_certificate"
  create_new_certificate = false
  private_key_path       = var.private_key_path
  certificate_body_path  = var.certificate_body_path
  certificate_chain_path = var.certificate_chain_path
  domain_name            = var.create_new_certificate ? var.domain_name : null
  route53_zone_id        = var.create_new_certificate ? var.route53_zone_id : null
  tags                   = local.tags
  environment            = var.environment
}



module "web_app" {
  source = "../../modules/ec2"
  subnet_id = module.vpc.public_subnet_ids[0]
  web_app_ami = var.web_app_ami
  web_app_instance_type = var.instance_type
  tags = local.tags
  environment = var.environment
}


module "alb" {
  source = "../../modules/alb"
  ec2_instance_id = module.web_app.ec2_instance_id
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  certificate_arn = module.ssl_certificate.certificate_arn
  tags = local.tags
  environment = var.environment
}


module "postgres" {
  source = "../../modules/postgres"
  postgres_instance_type = var.db_instance_type
  vpc_id = module.vpc.vpc_id
  allowed_cidrs = module.vpc.public_subnet_cidrs
  subnet_id = module.vpc.private_subnet_ids[0]
  postgres_ami = var.postgres_ami
  tags = local.tags
  environment = var.environment
}
