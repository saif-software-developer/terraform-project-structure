
#
# VARS
#
variable "region" {
  type = string
  default = "us-west-2"
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

provider "alks" {
  url = "https://alks.coxautoinc.com/rest"
}

terraform {
  backend "s3" {}
}