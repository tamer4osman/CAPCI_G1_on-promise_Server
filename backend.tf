terraform {
  backend "s3" {
    bucket         = "capci-gr1-project-backend-406843093389"
    key            = "CAPCI/on-prem/infrastructure/terraform.tfstates"
    dynamodb_table = "CAPCI-terraform-lock"
  }
}