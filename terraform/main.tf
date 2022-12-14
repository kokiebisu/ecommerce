module "networking" {
    source = "./modules/networking"
    
    namespace = var.namespace
}

module "load_balancer" {
    source = "./modules/load-balancer"

    namespace = var.namespace
    vpc = module.networking.vpc
    subnet = module.networking.subnet
}

module "ecs" {
    source = "./modules/ecs"

    namespace = var.namespace
    vpc = module.networking.vpc
    subnet = module.networking.subnet
    load_balancer_security_group = module.load_balancer.load_balancer_security_group
    load_balancer_target_group = module.load_balancer.load_balancer_target_group
    load_balancer_listener = module.load_balancer.load_balancer_listener
    ecr_url = "776733965771.dkr.ecr.us-east-1.amazonaws.com"
    repository_name = "ecommerce-product"
    tag = "latest"
}

module "api_gateway" {
    source = "./modules/api-gateway"

    namespace = var.namespace
    vpc = module.networking.vpc
    load_balancer_dns_name = module.load_balancer.load_balancer.dns_name
}

module "rds" {
    source = "./modules/rds"

    namespace = var.namespace
    vpc = module.networking.vpc
    subnet = module.networking.subnet
    db_username = "root"
    db_password = "password"
}
