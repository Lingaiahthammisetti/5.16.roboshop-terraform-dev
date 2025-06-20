module "bastion" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for bastion"
  vpc_id         = data.aws_vpc.default.id
  sg_name        = "bastion"
  #sg_ingress_rules = var.bastion_sg_ingress_rules
  common_tags    = var.common_tags
}

module "mongodb" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for MongoDB"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "mongodb"
  #sg_ingress_rules = var.mongodb_sg_ingress_rules
  common_tags    = var.common_tags
}

module "redis" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for redis"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "redis"
  #sg_ingress_rules = var.redis_sg_ingress_rules
  common_tags    = var.common_tags
}

module "mysql" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for mysql"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "mysql"
  #sg_ingress_rules = var.mysql_sg_ingress_rules
  common_tags    = var.common_tags
}

module "rabbitmq" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for rabbitmq"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "rabbitmq"
  #sg_ingress_rules = var.rabbitmq_sg_ingress_rules
  common_tags    = var.common_tags
}

module "catalogue" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for catalogue"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "catalogue"
  #sg_ingress_rules = var.catalogue_sg_ingress_rules
  common_tags    = var.common_tags
}

module "user" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for user"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "user"
  #sg_ingress_rules = var.user_sg_ingress_rules
  common_tags    = var.common_tags
}

module "cart" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for cart"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "cart"
  #sg_ingress_rules = var.cart_sg_ingress_rules
  common_tags    = var.common_tags
}

module "shipping" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for shipping"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "shipping"
  #sg_ingress_rules = var.shipping_sg_ingress_rules
  common_tags    = var.common_tags
}

module "payment" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for payment"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "payment"
  #sg_ingress_rules = var.payment_sg_ingress_rules
  common_tags    = var.common_tags
}

module "web" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for web"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "web"
  #sg_ingress_rules = var.web_sg_ingress_rules
  common_tags    = var.common_tags
}
module "dispatch" {
  #source ="../../5.12.terraform-aws-securitygroup"
  source = "git::https://github.com/Lingaiahthammisetti/5.12.terraform-aws-securitygroup.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_description = "SG for Dispatch"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  sg_name        = "dispatch"
  #sg_ingress_rules = var.dispatch_sg_ingress_rules
  common_tags    = var.common_tags
}



#bastion
resource "aws_security_group_rule" "bastion_home" {
  security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  cidr_blocks = ["0.0.0.0/0"] #ideally your home public IP address, but it frequently changes
}


resource "aws_security_group_rule" "mongodb_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}

#mongodb accepting connections from catalogue instance
resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}
resource "aws_security_group_rule" "redis_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}


resource "aws_security_group_rule" "mysql_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}


resource "aws_security_group_rule" "rabbitmq_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "catalogue_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "catalogue_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "catalogue_cart" {
  source_security_group_id = module.cart.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "user_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "user_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "user_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "cart_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "shipping_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "shipping_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "payment_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

resource "aws_security_group_rule" "payment_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

resource "aws_security_group_rule" "web_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}
resource "aws_security_group_rule" "dispatch_bastion" {
  source_security_group_id = module.bastion.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.dispatch.sg_id
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}
resource "aws_security_group_rule" "dispatch_ssh_from_home" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.dispatch.sg_id
}
resource "aws_security_group_rule" "web_ssh_from_home" {
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.web.sg_id
}

resource "aws_security_group_rule" "rabbitmq_dispatch" {
  source_security_group_id = module.dispatch.sg_id
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}