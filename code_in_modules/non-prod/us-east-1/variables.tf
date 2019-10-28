
#
# VARS
#
variable "region" {
  type = string
  default = "us-east-1"
}

variable "xx-dealercodes-lambda" {
  type = string
  default ="arn:aws:iam::xxxx:role/acct-managed/xx-dealercodes-lambda"
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
