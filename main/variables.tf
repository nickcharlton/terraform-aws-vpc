
variable "amis" {
    description = "AMIs by region"
    default = {
        us-west-2 = "ami-0bbe6b35405ecebdb" # ubuntu 18.04 LTS
    }
}

/*
  Terraform variable storage
*/

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-west-2"
}