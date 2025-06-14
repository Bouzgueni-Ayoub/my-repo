provider "aws" {
  region = "eu-central-1"
}
terraform {
  backend "s3" {
    bucket = "bouzgueni-state-bucket-stuff"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  force_destroy = true  # Optional: allows terraform destroy to delete non-empty buckets

  tags = {
    Name = var.bucket_name
    Environment = "Test1"
  }
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

