terraform {
     required_version = ">=1.0.0"
     required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
     }
}
provider "aws" {
     region = "eu-north-1"
} 
resource "aws_s3_bucket" "app_artifacts" {
     bucket = "aws-devops-lerning26726"
}
resource "aws_security_group" "app-sg" {
     name = "app-allow-ssh-http"
     description = "Allow SSH and HTTP trafic"

     ingress {
	      description = "Allow SSH" 
        from_port = "22"
    	  to_port = "22"
	      protocol = "tcp"
	      cidr_blocks = ["0.0.0.0/0"]
     }
     ingress {
	      description = "Allow HTTP"
	      from_port = "80"
	      to_port = "80"
	      protocol = "tcp"
	      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
	      description = "Allow all trafic"
	      from_port = "0"
	      to_port = "0"
	      protocol = "-1"
	      cidr_blocks = ["0.0.0.0/0"]
   }
}
