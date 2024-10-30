provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      "Project" = "Dotlanches"
    }
  }
}