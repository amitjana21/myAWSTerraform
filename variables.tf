variable "region" {
  type    = string
  default = "us-east-2"
}

# variable "environment" {
#   type = string
# }

# variable "account_env" {
#   type = string
# }

variable "ami_id" {
  type    = string
  #default = "ami-0ba62214afa52bec7"
}

variable "ec2_insance_size" {
  type    = string
  default = "t2.micro"
}
variable "vpc_id" {
  type    = string
  default = "vpc-0259bd00aedd55742"
}
variable "ec2_key_name" {
  type    = string
  default = "myDefaultKeypair"
}

variable "subnet_id" {
  type = string
  default = "subnet-022fb4db2989b27a3"
}

variable "security_group_id" {
  type = list(string)
  default = ["sg-0f5eca44422fe28f1"]
}

# variable "kms_key_id" {
#   type = string
# }