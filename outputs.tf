output "domain_identity_arn" {
  description = "ARN of the SES domain identity"
  value       = "${aws_ses_domain_identity.domain.arn}"
}

output "smtp_user_username" {
  value = "${aws_iam_access_key.smtp.id}"
}

output "smtp_user_password" {
  sensitive = true
  value     = "${aws_iam_access_key.smtp.ses_smtp_password}"
}
