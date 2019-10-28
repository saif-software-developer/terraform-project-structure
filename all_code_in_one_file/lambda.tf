
#
# VARS
#
variable "region" {
  type = string
  default = "us-east-1"
}

variable "resource-suffix" {
  type = string
  default = "-suffix"
}

variable "fd-dealercodes-lambda" {
  type = string
  default ="arn:aws:iam::xxxxx:role/acct-managed/xx-dealercodes-lambda"
}

#
# DATA 
#
data "archive_file" "dummy" {
  type  = "zip"
  output_path    =  "lambda_function_payload.zip"

  source  {
    content = "hello"
    filename  = "dummy.txt"
  }
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

#
# RESOURCES
#
resource "aws_lambda_function" "test" {
  filename      = "${data.archive_file.dummy.output_path}"
  function_name = "test${var.resource-suffix}"
  role          = "${var.fd-dealercodes-lambda}"
  handler       = "index.handler"

  runtime = "nodejs10.x"
  memory_size = 512
  timeout = 180

  # enable X-Ray for a Lambda function
  tracing_config {
    mode = "Active"
  }
}
