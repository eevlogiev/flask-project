data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_name
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "zone_arn" {
  value = aws_route53_zone.main.arn
}