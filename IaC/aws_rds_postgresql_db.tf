data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Project"
    values = ["Dotlanches"]
  }

  filter {
    name   = "tag:type"
    values = ["private"]
  }
}

data "aws_security_groups" "eks_security_groups" {
  filter {
    name   = "tag:aws:eks:cluster-name"
    values = ["dotcluster"]
  }
}

resource "aws_db_subnet_group" "postgresql_rds_subnet_group" {
  name       = "postgresql_rds-subnet-group"
  subnet_ids = data.aws_subnets.private_subnets.ids
}

resource "aws_db_instance" "pagamento-db" {
  identifier              = "dotlanche-pagamento-pgsql"
  db_name                 = "dotlanchePagamento"
  engine                  = "postgres"
  instance_class          = "db.t4g.micro"
  username                = var.pagamento_dbuser
  password                = var.pagamento_dbpassword
  vpc_security_group_ids  = data.aws_security_groups.eks_security_groups.ids
  db_subnet_group_name    = aws_db_subnet_group.postgresql_rds_subnet_group.name
  allocated_storage       = 20
  skip_final_snapshot     = true
  backup_retention_period = 0
  apply_immediately       = true
}

resource "aws_db_instance" "produto-db" {
  identifier              = "dotlanche-produto-pgsql"
  db_name                 = "dotlancheProduto"
  engine                  = "postgres"
  instance_class          = "db.t4g.micro"
  username                = var.produto_dbuser
  password                = var.produto_dbpassword
  vpc_security_group_ids  = data.aws_security_groups.eks_security_groups.ids
  db_subnet_group_name    = aws_db_subnet_group.postgresql_rds_subnet_group.name
  allocated_storage       = 20
  skip_final_snapshot     = true
  backup_retention_period = 0
  apply_immediately       = true
}

output "pagamento_db_address" {
  value = aws_db_instance.pagamento-db.address
}

output "produto_db_address" {
  value = aws_db_instance.produto-db.address
}
