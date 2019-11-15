provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id}:role/OrganizationEngineerAccessRole"
    session_name = "OrganizationEngineerAccessRole"
  }
}
