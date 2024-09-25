terraform {
  backend "s3" {
    key    = "states/dotlanche-database"
    region = "us-east-1"
  }
}