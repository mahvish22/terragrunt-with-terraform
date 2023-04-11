# dev/terragrunt.hcl
include "remote_state" {
  path = find_in_parent_folders()
}
locals {
  region = "us-east-1"
}

inputs = {
  environment = "dev"
  eks_cluster_name ="dev_eks"
  node_group_name = "webapp-dev"
  node_role_name = "nodeRole_dev"
  nodegroup_keypair =""
  cluster_role = "AWSEKSClusterRole-dev"
  region_name = local.region
  vpc_cidr_block = "10.0.0.0/16"
   public_subnets = {
    "${local.region}-a" = "10.0.0.0/24"
    "${local.region}-b" = "10.0.2.0/24" 
  }
  private_subnets = {
    "${local.region}-a" = "10.0.1.0/24"
    "${local.region}-b" = "10.0.3.0/24" 
  }


  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}