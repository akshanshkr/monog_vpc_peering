resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnet" {
  count = length(var.subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_cidrs[count.index]
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id
  description = "Allow inbound access"
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
