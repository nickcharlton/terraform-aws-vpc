/*
  Standard AWS provider file / plugin.  pulls variables from terraform.tfvars
*/

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}
