terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                      = "sa-east-1"
  access_key                  = "test"      
  secret_key                  = "test"
  skip_credentials_validation = true         
  skip_metadata_api_check     = true
  s3_use_path_style           = true         

  endpoints {
    dynamodb = "http://localhost:4566"
    ec2      = "http://localhost:4566"
    s3       = "http://localhost:4566"
    route53  = "http://localhost:4566"
  }
}