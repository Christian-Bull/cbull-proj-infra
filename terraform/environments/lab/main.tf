provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "lab"
      Provisioner = "terraform"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23"
    }
  }
  backend "s3" {
    bucket         = "cbull-proj-lab-tf-state"
    key            = "lab-state.tfstate"
    region         = "us-east-1"
  }
  required_version = ">= 0.14.9"
}

module "network" {
    source = "../../modules/network"

    vpc_name = "cbull-lab-vpc"
    vpc_cidr = "10.40.0.0/16"
}