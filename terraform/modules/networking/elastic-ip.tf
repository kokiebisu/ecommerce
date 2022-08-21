resource "aws_eip" "default" {
    count = 2
    vpc = true
    depends_on = [aws_internet_gateway.default]

    tags = {
      Name = "${var.namespace}-eip"
    }
}