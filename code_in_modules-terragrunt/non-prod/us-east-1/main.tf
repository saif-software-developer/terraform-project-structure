module "lambda_function" {
  source = "../../modules/lambda"  

  
  function-name = "black-label-test1"
  env = "nonprod"
  region = "${var.region}"
  runtime = "nodejs10.x"
  memory_size = 512
  timeout = 180

}