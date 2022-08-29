variable namespace {
  type = string
}

variable vpc {
  type = any
}

variable subnet {
  type = any
}

variable load_balancer_security_group {
  type = any
}

variable load_balancer_target_group {
  type = any
}

variable load_balancer_listener {
  type = any
}

variable ecr_url {
  type = string
}

variable repository_name {
  type = string
}

variable "tag" {
  type = string
}