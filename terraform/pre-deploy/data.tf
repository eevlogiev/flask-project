resource "local_file" "helm-values" {
  content = templatefile("templates/values.yaml.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "../../helm/values.yaml"
  file_permission      = "0644"
  directory_permission = "0751"
}
/*
resource "local_file" "terraform-pipeline" {
  content = templatefile("templates/terraform.yaml.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "../../.github/workflows/terraform.yaml"
  file_permission      = "0644"
  directory_permission = "0751"
}

resource "local_file" "deploy-pipeline" {
  content = templatefile("templates/deployment.yaml.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "../../.github/workflows/deployment.yaml"
  file_permission      = "0644"
  directory_permission = "0751"
}
*/
data "aws_caller_identity" "current" {}

resource "local_file" "role_arn" {
  content              =  aws_iam_role.gha_oidc_assume_role.arn
  filename             = "role-arn.txt"
  file_permission      = "0644"
  directory_permission = "0751"
}
