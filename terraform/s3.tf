/* resource "aws_s3_bucket" "terraform-bucket" {
    bucket = "terraform-state-55"

    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3-encryption" {
    bucket = aws_s3_bucket.terraform-bucket.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}

resource "aws_s3_bucket_versioning" "s3-versioning" {
  bucket = aws_s3_bucket.terraform-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform-state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}
*/