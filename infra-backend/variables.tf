variable "bucket_name_poc" {
  type        = string
  default     = "tfsate-backend-poc-05182022"  # replace here
  description = "Define Bucket for Terraform state file"
}

## Variales to connect to Providers 
variable "my_profile" {
  type = string
  default = "awspersonal"
  description = "Name of my profile configured in my awscli"
}