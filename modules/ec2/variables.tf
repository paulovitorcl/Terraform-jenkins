variable "instance_type" {
  type        = string
  description = "Define EC2 instance type"
}

variable "name" {
  type        = string
  description = "Define EC2 TAG name"
}

variable "aws_security_group" {
  type        = list(string)
  description = "Define EC2 Security Group"
}

variable "public_subnet_id" {
  type        = string
  description = "Define EC2 public subnet id"
}

#IAM configuration for EC2 

variable "role_name" {
  type        = string
  default     = "ec2_instance_role"
  description = "Define role name for the EC2 Instance Profile"
}

variable "ec2_profile" {
  type        = string
  default     = "ec2_instance_profile"
  description = "Define the name pf EC2 instance profile"
}

variable "ssm_attachment" {
  type        = string
  default     = "ssm_attachment"
  description = "Define the name of SSM policy attachment"
}

variable "ssm_policy_arn" {
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  description = "Define ARN for AmazonEC2RoleforSSM AWS managed policy"
}