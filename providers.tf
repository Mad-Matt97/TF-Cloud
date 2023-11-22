terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.23.1, <5.23.2"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
  required_version = ">1.2.0"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  alias  = "virginia"
  default_tags {
    tags = var.tags
    # access_key = var.access_key
    # secret_key = var.secret_key
  }
}


provider "random" {
  # Configuration options
}
