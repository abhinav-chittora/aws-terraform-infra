terraform {
  backend "s3" {
    bucket         = "your-production-terraform-state-bucket"
    key            = "production/terraform.tfstate"
    region         = "your-region"
    dynamodb_table = "your-dynamodb-lock-table"
  }
}