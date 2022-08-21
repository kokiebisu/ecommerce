output load_balancer_url {
  value = module.load_balancer.load_balancer.dns_name
}

output api_gateway_url {
  value = module.api_gateway.api_gateway_url
}
