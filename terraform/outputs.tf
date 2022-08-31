output load_balancer_url {
  value = module.load_balancer.load_balancer.dns_name
}

output api_gateway_url {
  value = module.api_gateway.api_gateway_url
}

output rds_hostname {
  value = module.rds.rds_hostname
}

output rds_port {
  value = module.rds.rds_port
}

output rds_username {
  value = module.rds.rds_username
}
