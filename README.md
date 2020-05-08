terraform-aws-ec2-iam-role
==========================

Terraform module to create IAM role and instance profile for EC2


Usage
-----

```hcl
module "ec2-iam-role" {
  source  = "Smartbrood/ec2-iam-role/aws"
  name    = "ec2-iam-role"
  version = "0.3.0"

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
  ]
}
```


Usage with depend_on:
-----

```hcl
resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

module "ec2-iam-role" {
  source    = "Smartbrood/ec2-iam-role/aws"
  name      = "ec2-iam-role"
  version   = "0.4.0"
  depend_on = aws_iam_policy.policy

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
    aws_iam_policy.policy.arn
  ]
}
```


Authors
-------

Module managed by [Smartbrood LLC](https://github.com/Smartbrood).


License
-------

Apache 2 Licensed. See LICENSE for full details.
