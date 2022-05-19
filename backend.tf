##########################################################################################
# Please, create your own tfstate backend bucket and dynamodb_table
##########################################################################################

terraform {
  backend "s3" {
    bucket  = "tfsate-backend-poc-05182022"
    key     = "poc_aws_jenkins.tfstate"
    region  = "us-east-1"
    profile = "awspersonal"
  }
}