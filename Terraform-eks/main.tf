
module "vpc" {
  source = "./modules/vpc"

  cidr_block = "10.0.0.0/16"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "my-eks-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.subnet_ids
  node_group_name = "eks-node-group"
}
