module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "springboot-microservices-eks"
  cluster_version = "1.27"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  enable_fargate                 = true

  fargate_profiles = {
    default = {
      selectors = [{ namespace = "default" }]
    }
  }
}

