module "lambda_function" {
  source = "../../modules/lambda"  

  function-name = "black-label-test"
  env = "nonprod"
  region = "${var.region}"
  runtime = "nodejs10.x"
  memory_size = 512
  timeout = 180

}