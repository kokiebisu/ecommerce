output "vpc" {
    value = aws_vpc.default
}

output "subnet" {
    value = {
        public = aws_subnet.public,
        private = aws_subnet.private
    }
}
