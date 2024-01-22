resource "local_file" "helm-values" {
  content = templatefile("templates/values.yaml.tpl", {
    account_id = data.aws_caller_identity.current.account_id
  })

  filename             = "../../helm/values.yaml"
  file_permission      = "0644"
  directory_permission = "0751"
}
data "aws_caller_identity" "current" {}
