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
        ebs_volume_type = "STANDARD"
        instance_size = "M0"
        node_count    = 3
      }

      analytics_specs {
        ebs_volume_type = "STANDARD"
        instance_size = "M0"
        node_count = 3
      }

    }
  }
}

output "connection_strings" {
  value = mongodbatlas_advanced_cluster.cluster.connection_strings[0].standard_srv
}
