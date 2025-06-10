terraform {
  backend "s3" {
    bucket         = "7erafy-bucket"
    key            = "terraform/state"
    region        = "us-east-1"
  }
}