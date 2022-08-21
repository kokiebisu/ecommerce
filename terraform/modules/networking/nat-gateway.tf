# nat gateway allows resources withint the VPC to communicate with the internet but will prevent communication to the VPC 
# from outside sources. 
resource "aws_nat_gateway" "default" {
    count = 2
    subnet_id = element(aws_subnet.public.*.id, count.index)
    allocation_id = element(aws_eip.default.*.id, count.index)

    tags = {
      Name = "${var.namespace}-nat-gateway"
    }
}
