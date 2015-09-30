#variable "key_name" {
#  description = "AWS region to launch servers"
#}

# US West (Oregon)
variable "aws_region" {
  description = "AWS region to launch servers"
  default = "us-west-2"
}

variable "aws_group" {
  description = "Development group"
  default = "geodev"
}

# AMI to use, Root device type: ebs
#variable "aws_ami" {
#}

#variable "aws_private_dns" {
#  description = "The zone ID of the private hosted DNS Route53"
#}

#variable "aws_security_group"{
#  description = "The AWS security group to place these machines in."
#}

#variable "aws_vpc_subnet" {
#  description = "AWS region to place a single server.  This can be a public or private subnet."
#}

#variable "aws_vpc_subnets" {
#  description = "AWS region to place an ELB or ASG.  This will be a list of public or private subnets."
#}

variable "environment" {
  description = "AWS environment destination"
}

variable "instance_type" {
  description = "AWS Instance type"
}

variable "instance_prefix" {
  description = "Prefix to add to instance names"
  default = "cdiab"
}

variable "instance_count" {
  description = "Number of instances to create"
  default = 1
}

variable "container_name" {
  description = "Name of the pipeline api container"
  default = "cdiab"
}

variable "container_port" {
  description = "Port of the pipeline api container"
  default = 3000
}

variable "iam" {
  description = "Port of the pipeline api container"
  default = "ecsInstanceRole"
}

