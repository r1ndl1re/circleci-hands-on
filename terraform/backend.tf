terraform {
  backend "s3" {
    bucket         = "terraform-state-r1ndl1re"
    key         = "circleci-hands-on.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-state-lock"
  }
}
