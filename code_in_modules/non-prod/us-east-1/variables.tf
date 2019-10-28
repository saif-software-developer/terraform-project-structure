
#
# VARS
#
variable "region" {
  type = string
  default = "us-east-1"
}

variable "fd-dealercodes-lambda" {
  type = string
  default ="arn:aws:iam::489430075229:role/acct-managed/fd-dealercodes-lambda"
}

#
# PROVIDERS
#
provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {}
}
