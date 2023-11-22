variable "bucket_name" {
    type = string
    description = "nombre del bucket s3"
}

resource "random_string" "randomNizer" {
  length = 8
  upper = false
  lower = true
  special = false
}