provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "7erafy-bucket"

  tags = {
    Name = "terraform-state-bucket"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-locks" # or use a unique suffix
#   hash_key     = "LockID"
#   billing_mode = "PAY_PER_REQUEST"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name = "terraform-locks"
#   }
# }
 
 
