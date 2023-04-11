# prod/terragrunt.hcl
include "remote_state" {
  path = find_in_parent_folders()
}
locals {
  region = "us-east-1"
}

inputs = {
  environment = "prod"
  eks_cluster_name ="prod_eks"
  node_group_name = "webapp-prod"
  node_role_name = "nodeRole_prod"
  nodegroup_keypair =""
  cluster_role = "AWSEKSClusterRole-prod"
  region_name = local.region
  vpc_cidr_block = "10.20.0.0/16"
   public_subnets = {
    "${local.region}-a" = "10.20.0.0/24"
    "${local.region}-b" = "10.20.2.0/24" 
  }
  private_subnets = {
    "${local.region}-a" = "10.20.1.0/24"
    "${local.region}-b" = "10.20.3.0/24" 
  }


  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "prod"
  }
}
