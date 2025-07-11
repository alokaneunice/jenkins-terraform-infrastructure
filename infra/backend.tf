terraform {
  backend "s3" {
    bucket = "tweek-bucket345426"
    region = "us-east-2"
    key    = "terraform-jenkins-aws2/terraform.tfstate"
  }
}