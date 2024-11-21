provider "aws" {
  region = "us-west-2"
}

locals {
  name        = "lambda"
  environment = "test"
}

##-----------------------------------------------------------------------------
## lambda Module Call with s3_bucket.
##-----------------------------------------------------------------------------
module "lambda" {
  source      = "../../"
  name        = local.name
  environment = local.environment
  s3_bucket   = "yadav555"
  s3_key      = "index.zip"
  handler     = "index.handler"
  runtime     = "nodejs18.x"
  variables = {
    foo = "bar"
  }
}
