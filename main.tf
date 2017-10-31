resource "aws_iam_instance_profile" "this" {
  name = "${var.name}"
  role = "${aws_iam_role.this.name}"
  path = "${var.path}"
}

resource "aws_iam_role" "this" {
  name                  = "${var.name}"
  path                  = "${var.path}"
  description           = "${var.description}"
  force_detach_policies = "${var.force_detach_policies}"
  assume_role_policy    = "${data.aws_iam_policy_document.this.json}"
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = "${length(var.policy_arn)}"
  role       = "${aws_iam_role.this.name}"
  policy_arn = "${var.policy_arn[count.index]}"
}
