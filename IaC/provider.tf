provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Project" = "Dotlanches"
    }
  }
}