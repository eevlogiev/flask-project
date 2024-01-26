locals {
  name      = "flask"
  source_ip = "0.0.0.0/0"
  region    = "us-east-1"
  env       = "dev"

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  azs           = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_cidr      = "10.0.0.0/16"
  instance_type = "t2.medium"
  account_id    = data.aws_caller_identity.current.account_id
  domain        = "ev4o.com"
}
