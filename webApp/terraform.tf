terraform {
  # backend "s3" {
  #   bucket = "abanoub-bucket-01"
  #   key    = "prod/aws_infra"
  #   region = "us-east-1"
  #   dynamodb_table = "terraLock"
  #   encrypt        = true
  # }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "AWS_Test_organization"

    workspaces {
      name = "my-aws-app"
    }
  }
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    http = {
      source  = "hashicorp/http"
      version = "> 2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "> 3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "> 2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "> 3.1.0"
    }
  }
}