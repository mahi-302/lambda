provider "aws"{
  region="us-east-2"
}
resource "aws_iam_role" "lamda_my1" {
  name = "lamda_my1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "testlambda" {
  filename      = "lammbda1.zip"
  function_name = "lambda_function_testlambda"
  role          = aws_iam_role.lamda_my1.arn
  handler       = "index.test"
 source_code_hash = filebase64sha256("lammbda1.zip")
runtime = "python3.9"
}
