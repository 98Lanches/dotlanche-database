resource "mongodbatlas_project" "project" {
  name   = "dotlanches-database"
  org_id = var.org_id
}

output "project_name" {
  value = mongodbatlas_project.project.name
}