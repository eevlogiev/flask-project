module "eks" {
  source = "./modules/terraform-aws-eks"

  cluster_name    = "${local.name}-cluster"
  cluster_version = "1.28"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets
  enable_irsa     = true
  cluster_identity_providers = {
    sts = {
      client_id = "sts.amazonaws.com"
    }
  }
  eks_managed_node_group_defaults = {
    disk_size      = 20
    instance_types = ["t2.medium"]
  }

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    #    aws-ebs-csi-driver = {
    #      most_recent = true
    #    }
  }
  eks_managed_node_groups = {
    general = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
      labels = {
        role = "general"
      }
      capacity_type = "ON_DEMAND"
    }
  }
  cluster_endpoint_public_access = true
  manage_aws_auth_configmap      = true

  aws_auth_roles = [
    {
      rolearn  = aws_iam_role.role2.arn
      username = "${local.name}-role"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    data.aws_caller_identity.current.account_id
  ]
}

resource "aws_iam_role" "role2" {
  name               = "eks-role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/cloud_user"
     },
     "Effect": "Allow"
   }
 ]
}
EOF
}

module "cert_manager_irsa_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  depends_on                    = [module.eks]
  version                       = "v5.33.0"
  role_name                     = "cert-manager"
  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = [aws_route53_zone.main.arn]

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:cert-manager"]
    }
  }
}

module "external_dns_irsa_role" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  depends_on                    = [module.eks]
  version                       = "v5.33.0"
  role_name                     = "external-dns"
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = [aws_route53_zone.main.arn]

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-dns"]
    }
  }
}
