# Mongo DB Atlas

variable "atlas_public_key" {
  type        = string
  sensitive   = true
  description = "Public Programmatic API key to authenticate to Atlas"
}
variable "atlas_private_key" {
  type        = string
  sensitive   = true
  description = "Private Programmatic API key to authenticate to Atlas"
}
variable "atlas_org_id" {
  type        = string
  description = "MongoDB Organization ID"
}
variable "atlas_producao_db" {
  type        = string
  description = "MongoDB Atlas Producao Database name"
}
variable "atlas_producao_dbuser_name" {
  type        = string
  description = "MongoDB Atlas Producao API Database User Name"
}
variable "atlas_producao_dbuser_password" {
  type        = string
  sensitive   = true
  description = "MongoDB Atlas Producao API Database User Password"
}

variable "atlas_pedido_db" {
  type        = string
  description = "MongoDB Atlas Pedido Database name"
}

variable "atlas_pedido_dbuser_name" {
  type        = string
  description = "MongoDB Atlas Pedido API Database User Name"
}
variable "atlas_pedido_dbuser_password" {
  type        = string
  sensitive   = true
  description = "MongoDB Atlas Pedido API Database User Password"
}

# AWS RDS Potgresql
variable "pagamento_dbuser" {
  type        = string
  description = "AWS RDS Pagamento Database User Name"
}
variable "pagamento_dbpassword" {
  type        = string
  sensitive   = true
  description = "AWS RDS Pagamento Database Password"
}

variable "produto_dbuser" {
  type        = string
  description = "AWS RDS Produto Database User Name"
}
variable "produto_dbpassword" {
  type        = string
  sensitive   = true
  description = "AWS RDS Produto Database Password"
}
