variable "virginia_cidr" {
  description = "cidr para la region de virginia"
  sensitive   = false
  type        = string
}

/* variable "public_subnet" {
  description = "cidr public subnet"
  type = string
}

variable "private_subnet" {
    type = string
    description = "subnet privada"
} */

variable "subnets" {
  description = "lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "tags del proyecto"
  type        = map(string)

}

variable "ingress_cidr" {
  description = "cidr for ingress traffic"
  type        = string

}

variable "ec2_specs" {
  description = "parametros de la instancia"
  type        = map(string)

}

variable "enable_monitoring" {
  description = "habilita la creación de la estancia monitoreo"
  type        = number
}

variable "ingress_port_list" {
  description = "lista de puertos de ingress"
  type        = list(number)

}

variable "AWS_ACCESS_KEY_ID" {}

variable "AWS_SECRET_ACCESS_KEY" {}