module "database" {
    source = "./modules/database"
    namespace = var.namespace
}

module "networking" {
    source = "./modules/networking"
    namespace = var.namespace
}
