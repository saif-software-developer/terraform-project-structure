#
# DATA 
#
data "archive_file" "dummy" {
  type  = "zip"
  output_path    =  "lambda_function_payload.zip"

  source  {
    content = "Hello from black-label"
    filename  = "dummy.txt"
  }
}

#
# RESOURCES
#
resource "aws_lambda_function" "lambda-function" {
  filename      = "${data.archive_file.dummy.output_path}"
  function_name = "${var.function-name}-${var.env}"
  role          = "${var.fd-dealercodes-lambda}"
  handler       = "index.handler"

  runtime = var.runtime
  memory_size = var.memory_size
  timeout = var.timeout

  # enable X-Ray for a Lambda function
  tracing_config {
    mode = "Active"
  }

}