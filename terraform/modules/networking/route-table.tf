## PUBLIC

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.namespace}-route-table-public"
  }
}

resource "aws_route" "public" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
}

resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

## PRIVATE 

resource "aws_route_table" "private" {
  count = 2
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.namespace}-route-table-private"
  }
}

resource "aws_route" "private" {
  count = 2
  route_table_id = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = element(aws_nat_gateway.default.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = 2
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
