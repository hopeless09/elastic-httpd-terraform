provider "aws" {}

terraform {
  backend "s3" {
    bucket = "terraform-elasticsearch-nignx"
    key    = "state/terraform.state"
    region = "us-east-2"
  }
}
