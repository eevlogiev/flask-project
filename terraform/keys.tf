resource "aws_key_pair" "deployer" {
  key_name   = "${local.name}-key"
  public_key = var.public_key
}