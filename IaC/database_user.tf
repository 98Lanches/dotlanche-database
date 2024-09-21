resource "mongodbatlas_database_user" "user" {
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "dotlanches"
  }
  labels {
    key   = "Name"
    value = "dotlanches-api"
  }
}