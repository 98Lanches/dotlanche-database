variable "public_key" {
  type        = string
  sensitive = true
  description = "Public Programmatic API key to authenticate to Atlas"
}
variable "private_key" {
  type        = string
  sensitive = true
  description = "Private Programmatic API key to authenticate to Atlas"
}
variable "org_id" {
  type        = string
  description = "MongoDB Organization ID"
}
variable "dbuser" {
  type        = string
  description = "MongoDB Atlas Database User Name"
}
variable "dbuser_password" {
  type        = string
  sensitive = true
  description = "MongoDB Atlas Database User Password"
}