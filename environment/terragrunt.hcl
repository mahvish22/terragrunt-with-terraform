# Indicate where to source the terraform module from.
# The URL used here is a shorthand for
# "tfr://registry.terraform.io/terraform-aws-modules/vpc/aws?version=3.5.0".
# Note the extra `/` after the protocol is required for the shorthand notation.

terraform {
  // source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
  source = "git::git@github.com:mahvish22/terragrunt-with-terraform.git//aws-vpc-network-terraform/modules?ref=v1.0.0"
}

/*Indicate what region to deploy the resources into
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF

provider "aws" {
  region = var.region_name
}
EOF
} */
# env/terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "my-terraform-terragrunt-state"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    // dynamodb_table = "my-lock-table"
  }
}
# Indicate the input values to use for the variables of the module.
