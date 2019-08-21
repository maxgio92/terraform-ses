# terraform-ses

Terraform module to setup AWS SES.

This module creates an AWS SES resource and adds DKIM records to the provided Route53 zone ID.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Domain to use for SES | string | n/a | yes |
| ses\_records | Additional entries which are added to the _amazonses record | list | `<list>` | no |
| zone\_id | Route 53 zone ID for the SES domain verification | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| domain\_identity\_arn | ARN of the SES domain identity |
| smtp\_user\_password |  |
| smtp\_user\_username |  |

## Example

```terraform
module "ses" {
  source  = "../../modules/ses"
  domain  = "${var.domain_name}"
  zone_id = "${aws_route53_zone.zone.zone_id}"
}
```