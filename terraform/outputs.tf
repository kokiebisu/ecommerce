output "load_balancer_url" {
  value = module.load_balancer.load_balancer.dns_name
}