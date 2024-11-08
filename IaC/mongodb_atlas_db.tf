resource "mongodbatlas_project" "project" {
  name   = "dotlanches-database"
  org_id = var.atlas_org_id
}

resource "mongodbatlas_advanced_cluster" "cluster" {
  project_id     = mongodbatlas_project.project.id
  name           = "dotlanches-db-cluster"
  cluster_type   = "REPLICASET"
  backup_enabled = false

  replication_specs {
    region_configs {
      priority      = 7
      provider_name = "TENANT"
      backing_provider_name = "AWS"
      region_name   = "US_EAST_1"
      electable_specs {
        instance_size = "M0"
      }
    }
  }
}

resource "mongodbatlas_database_user" "user" {
  username           = var.atlas_dbuser_name
  password           = var.atlas_dbuser_password
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "dotlanche"
  }
  labels {
    key   = "Name"
    value = "dotlanches-api"
  }
}

resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.project.id
  cidr_block = "0.0.0.0/0"
  comment    = "allow all"
}

output "connection_strings" {
  value = mongodbatlas_advanced_cluster.cluster.connection_strings[0].standard_srv
}

output "project_name" {
  value = mongodbatlas_project.project.name
}