# terraform-aws-vpc

This repository contains a [Terraform][] project that builds [Scenario 2: VPC with Public and Private Subnets][scenario_two] from the [AWS documentation][].
It's from [this blog post][blog_post] describing how it all works and is designed to give a working example which can the basis of something much more complex.

## Usage

`terraform.tfvars` holds variables which should be overriden with valid ones.

### Plan

```
terraform plan -var-file terraform.tfvars
```

### Apply

```
terraform apply -var-file terraform.tfvars
```

### Destroy

```
terraform destroy -var-file terraform.tfvars
```

## Author

Copyright (c) 2015 Nick Charlton <nick@nickcharlton.net>. MIT Licensed.

[Terraform]: http://terraform.io
[scenario_two]: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html
[AWS documentation]: http://aws.amazon.com/documentation/
[blog_post]: https://nickcharlton.net/posts/id
