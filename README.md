terraform-aws-ec2-iam-role
==========================

Terraform module to create IAM role and instance profile for EC2


Usage
-----

```hcl
module "ec2-iam-role" {
  source = "Smartbrood/ec2-iam-role/aws"
  name   = "ec2-iam-role"

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
  ]
}
```


Authors
-------

Module managed by [Smartbrood LLC](https://github.com/Smartbrood).


License
-------

Apache 2 Licensed. See LICENSE for full details.
