variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type = list(string)
}
