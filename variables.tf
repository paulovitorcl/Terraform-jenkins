## Variales to connect to Providers 
variable "my_profile" {
  type        = string
  default     = "awspersonal"
  description = "Name of my profile configured in my awscli"
}

## Variables to deploy Network modules 

variable "availability_zones" {
  type        = string
  default     = "us-east-1a"
  description = "Define subnet AZ"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.10.0.0/16"
  description = "Define VPC CIDR block"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.10.1.0/24"
  description = "Define public subnet CIDR"
}

variable "vpc_name" {
  type        = string
  default     = "poc-jenkins-taurus"
  description = "Define the name of the network"
}

## Variables to deploy EC2 module 

variable "instance_type" {
  type        = string
  default     = "t2.medium"
  description = "Define the EC2 instance type"
}

variable "name" {
  type        = string
  description = "Define EC2 TAG name"
  default     = "jenkins-lab"
}