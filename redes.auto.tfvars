virginia_cidr = "10.10.0.0/16"
/* public_subnet = "10.10.0.0/24"
private_subnet = "10.10.1.0/24" */
subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "env"         = "dev"
  "owner"       = "Miguel"
  "cloud"       = "aws"
  "IAC"         = "Terraform"
  "IAC_version" = "1.3.6"
  "project"     = "cerberus"
  "region"      = "virginia"
}

ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-05c13eab67c5d8861"
  "instance_type" = "t2.micro"
}

enable_monitoring = 0

ingress_port_list = [22, 80, 443]