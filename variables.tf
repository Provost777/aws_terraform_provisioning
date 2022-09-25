variable "vpc_cidr_block" {
  description = "default cidr block for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "default instance tenancy"
  type        = string
  default     = "default"
}

variable "ec2_instance_type" {
  default = "t2.medium"

}

variable "ec2_ami" {
  default = "ami-06640050dc3f556bb"

}

variable "ec2_count" {
  default = "1"

}