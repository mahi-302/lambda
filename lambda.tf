provider "aws"{
  region="us-east-2"
}
resource "aws_iam_role" "iam_for_lmda" {
  name = "iam_for_lmda"

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
