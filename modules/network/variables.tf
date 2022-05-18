variable "name" {
  type        = string
  description = "Define the name of the network"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Define VPC CIDR block"
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "Define public subnet CIDRs"
}

variable "availability_zones" {
  type        = string
  description = "Define subnet AZ"
}

variable "public_ports" {
  type        = list(number)
  default     = ["80", "443", "8080"]
  description = "Define ports for public SG"
}