resource "aws_db_subnet_group" "default" {
    name = "${var.namespace}-db"
    subnet_ids = [ for k, v in var.subnet.public:var.subnet.public[k].id ]

    tags = {
        Name = "${var.namespace}-db"
    }
}

resource "aws_db_instance" "product" {
    identifier = "product"
    instance_class = "db.t2.micro"
    allocated_storage = 10
    engine = "mysql"
    engine_version = "8.0.15"
    username = var.db_username
    password = var.db_password
    port = 3306
    db_subnet_group_name = aws_db_subnet_group.default.name
    vpc_security_group_ids = [aws_security_group.rds.id]
    publicly_accessible = true
    skip_final_snapshot = true
}
