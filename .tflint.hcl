plugin "aws" {
  enabled = true
  version = "0.19.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_instance_invalid_type" {
  enabled = true
}

rule "aws_instance_invalid_ami" {
  enabled = true
}

rule "aws_resource_missing_tags" {
  enabled = false
  tags    = ["Terraform", "application", "env", "region"]
}

rule "terraform_naming_convention" {
  enabled = false
  format  = "snake_case"
}

rule "aws_instance_previous_type" {
  enabled = true
}

rule "aws_db_instance_previous_type" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = false
}

rule "aws_iam_user_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_user_policy_attachment_invalid_user" {
  enabled = true
}

rule "aws_iam_role_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_role_invalid_name" {
  enabled = true
}

rule "aws_iam_role_invalid_assume_role_policy" {
  enabled = true
}

rule "aws_iam_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_policy_invalid_name" {
  enabled = true
}

rule "aws_iam_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_group_policy_invalid_policy" {
  enabled = true
}

rule "aws_iam_group_policy_invalid_group" {
  enabled = true
}

rule "aws_iam_group_policy_attachment_invalid_policy_arn" {
  enabled = true
}

rule "aws_iam_group_policy_attachment_invalid_group" {
  enabled = true
}

rule "aws_iam_group_membership_invalid_group" {
  enabled = true
}

rule "aws_flow_log_invalid_log_destination_type" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = false
}
