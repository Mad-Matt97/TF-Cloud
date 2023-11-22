provider "random" {
}

resource "aws_s3_bucket" "cerberus_bucket" {
bucket = "${var.bucket_name}${random_string.randomNizer.result}"
}
