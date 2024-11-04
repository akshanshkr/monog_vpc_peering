module "vpc" {
  source = "./module/vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24"]
}

module "mongodb" {
  source = "./module/mongodb"
  mongodb_public_key = "your-mongodb-public-key"
  mongodb_private_key = "your-mongodb-private-key"
  mongodb_org_id = "your-mongodb-org-id"
  mongodb_project_name = "your-project-name"
  cluster_name = "your-cluster-name"
  mongodb_region = "us-east-1"
  vpc_id = module.vpc.vpc_id
  aws_account_id = "your-aws-account-id"
}

module "ec2" {
  source = "./module/ec2"
  ami_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_ids[0]
  security_group_id = module.vpc.security_group_id
  mongo_connection_string = module.mongodb.connection_string
}
