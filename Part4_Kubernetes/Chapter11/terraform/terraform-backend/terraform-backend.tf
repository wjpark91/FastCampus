resource "aws_s3_bucket" "ahntest2-s3-tf-state" {

  bucket = "ahntest2-s3-tf-state"

  tags = {
    "Name" = "ahntest2-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "ahntest2-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.ahntest2-s3-tf-state]
  name         = "ahntest2-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "ahntest2-ddb-tf-lock"
  }

}