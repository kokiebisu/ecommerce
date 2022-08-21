resource "aws_subnet" "public" {
    count = 2
    vpc_id = aws_vpc.default.id
    cidr_block = cidrsubnet(aws_vpc.default.cidr_block, 8, 2 + count.index)
    availability_zone = data.aws_availability_zones.available_zones.names[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.namespace}-public-subnet"
    }
}

resource "aws_subnet" "private" {
    count = 2
    vpc_id = aws_vpc.default.id
    cidr_block = cidrsubnet(aws_vpc.default.cidr_block, 8, count.index)
    availability_zone = data.aws_availability_zones.available_zones.names[count.index]

    tags = {
        Name = "${var.namespace}-private-subnet"
    }
}
