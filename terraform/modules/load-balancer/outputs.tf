output load_balancer {
    value = aws_lb.default
}

output load_balancer_security_group {
    value = aws_security_group.load_balancer
}

output load_balancer_target_group {
    value = aws_lb_target_group.default
}

output load_balancer_listener {
    value = aws_lb_listener.default
}
