##########################################################################################
# Please, create your own tfstate backend bucket and dynamodb_table
##########################################################################################

terraform {
    backend "s3" {
        bucket = ""
        key = poc_aws_jenkins.tfstate
    }
}