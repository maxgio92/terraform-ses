resource "aws_iam_user" "smtp" {
  name = "ses-smtp-user"
}

data "aws_iam_policy_document" "smtp-send-email" {
  statement {
    sid = "SESSendRawEmail"

    actions = [
      "ses:SendRawEmail",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_user_policy" "smtp" {
  name   = "smtp-send-email"
  user   = "${aws_iam_user.smtp.name}"
  policy = "${data.aws_iam_policy_document.smtp-send-email.json}"
}

resource "aws_iam_access_key" "smtp" {
  user = "${aws_iam_user.smtp.name}"
}
