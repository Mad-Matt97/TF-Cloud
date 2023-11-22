terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.23.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">=3.5.1"
    }
  }
  required_version = ">1.2.0"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  alias  = "virginia"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.tags
  }
}


provider "random" {
  # Configuration options
}
