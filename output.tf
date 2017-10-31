output "arn" {
  description = "The ARN of IAM Role"
  value       = "${aws_iam_role.this.arn}"
}

output "unique_id" {
  description = "The ARN Unique ID of IAM Role"
  value       = "${aws_iam_role.this.unique_id}"
}

output "profile_name" {
  description = "The Instance profile Name"
  value       = "${aws_iam_instance_profile.this.name}"
}
