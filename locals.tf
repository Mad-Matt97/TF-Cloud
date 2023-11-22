locals {
  suffix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"
} #recurso-proyecto-entorno-region

resource "random_string" "sufijo_s3" {
  length  = 8
  upper   = false
  special = false

}

locals {
  s3_suffix = "${var.tags.project}-${random_string.sufijo_s3.id}"
}