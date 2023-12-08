/**************************
//
//COMMISSIONING PROFILER LAMBDA
//
**************************/


module "commissioning-profiler-lambda" {
  source = "../../modules/lambda"

  function_name = var.commissioning_profiler_function_name
  description   = "Microservice for Commissioning Profiler"

  policy_jsons = [
    <<-EOT
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "DynamodbTable",
                    "Effect": "Allow",
                    "Action": [
                        "dynamodb:PutItem",
                        "dynamodb:DeleteItem",
                        "dynamodb:GetItem",
                        "dynamodb:Scan",
                        "dynamodb:Query",
                        "dynamodb:UpdateItem"
                    ],
                    "Resource": [
                        "${module.dynamodb_commissioning_profiler_table.dynamodb_table_arn}"
                    ]
                }
            ]
        }
        EOT
  ]
}
