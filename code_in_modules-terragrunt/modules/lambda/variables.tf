
#
# VARS
#
variable "region" {
  type = string
}

variable "function-name" {
  type = string
}

variable "env" {
  type = string
}

variable "runtime" {
  type = string
}

variable "memory_size" {
  type = number
}

variable "timeout" {
  type = number
}

variable "fd-dealercodes-lambda" {
  type = string
  default ="arn:aws:iam::xxxx:role/acct-managed/xx-dealercodes-lambda"
}
