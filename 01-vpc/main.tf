module "roboshop" {
  #source = "../terraform-aws-vpc"
  source = "git::https://github.com/Lingaiahthammisetti/5.9.terraform-aws-vpc-peering.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags

  # public subnet
  public_subnet_cidrs = var.public_subnets_cidr

  # private subnet
  private_subnet_cidrs = var.private_subnets_cidr

  # database subnet
  database_subnet_cidrs = var.database_subnets_cidr

  #peering
  is_peering_required = var.is_peering_required
  


}