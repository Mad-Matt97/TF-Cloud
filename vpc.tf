resource "aws_vpc" "vpc-virginia" {
  cidr_block       = var.virginia_cidr
  instance_tenancy = "default"


  tags = {
    Name = "VPC_VIRGINIA-${local.suffix}"
  }
  provider = aws.virginia
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc-virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet-${local.suffix}"
  }

}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc-virginia.id
  cidr_block = var.subnets[1]

  tags = {
    Name = "Private_Subnet-${local.suffix}"
  }

  depends_on = [
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw_vpc_virginia" {
  vpc_id = aws_vpc.vpc-virginia.id

  tags = {
    Name = "igw vpc virginia-${local.suffix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc-virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_virginia.id
  }

  tags = {
    Name = "public crt-${local.suffix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance_" {
  name        = "public instance sg"
  description = "Allow TLS inbound traffic and All egresss traffic"
  vpc_id      = aws_vpc.vpc-virginia.id

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.ingress_cidr]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "public instance sg-${local.suffix}"
  }
}

module "mybucket" {
  source      = "./modulos/s3"
  bucket_name = "nombreunico"
}

output "s3_arn" {
  value = module.mybucket.s3_bucket_arn
}



# module "terraform_state_backend" {
#   source     = "cloudposse/tfstate-backend/aws"
#   version    = "1.3.0"
#   namespace  = "exampledespliegues"
#   stage      = "prod"
#   name       = "terraform"
#   attributes = ["state"]

#   terraform_backend_config_file_path = "."
#   terraform_backend_config_file_name = "backend.tf"
#   force_destroy                      = false
# }

