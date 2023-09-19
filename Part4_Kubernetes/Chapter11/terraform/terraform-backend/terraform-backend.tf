resource "aws_s3_bucket" "pwj-s3-tf-state" {

  bucket = "pwj-s3-tf-state"

  tags = {
    "Name" = "pwj-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "pwj-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.pwj-s3-tf-state]
  name         = "pwj-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "pwj-ddb-tf-lock"
  }

}