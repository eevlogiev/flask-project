resource "local_file" "helm-values" {
  content = templatefile("templates/values.yaml.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "../../helm/values.yaml"
  file_permission      = "0644"
  directory_permission = "0751"
}

resource "local_file" "assume_role" {
  content = templatefile("templates/assume_role.sh.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "assume_role.sh"
  file_permission      = "0644"
  directory_permission = "0751"
}

data "aws_caller_identity" "current" {}

resource "local_file" "role_arn" {
  content              = aws_iam_role.gha_oidc_assume_role.arn
  filename             = "role-arn.txt"
  file_permission      = "0644"
  directory_permission = "0751"
}
