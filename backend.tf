# terraform {
#   required_version = ">= 1.0.0"

#   backend "s3" {
#     region   = "us-east-1"
#     bucket   = "exampledespliegues-prod-terraform-state"
#     key      = "terraform.tfstate"
#     profile  = ""
#     role_arn = "arn:aws:iam::524723088265:role/testmodulodespliegues"
#     encrypt  = "true"

#     dynamodb_table = "exampledespliegues-prod-terraform-state-lock"
#   }
# }
