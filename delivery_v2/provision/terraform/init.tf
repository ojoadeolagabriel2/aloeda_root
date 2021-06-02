terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

variable "instance_name" {
  description = "aws ec2 instance name"
  type        = string
  default     = "app_instance"
}

variable "db_instance_name" {
  description = "aws ec2 db instance name"
  type        = string
  default     = "db_instance"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0cf6f5c8a62fa5da6"
  instance_type = "t2.micro"
  tags = {
    Name=var.instance_name
  }
}

resource "aws_instance" "db_instance" {
  ami           = "ami-0cf6f5c8a62fa5da6"
  instance_type = "t2.micro"
  tags = {
    Name=var.db_instance_name
  }
}