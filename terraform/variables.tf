variable "default_region" {
  description = "Default AWS region"
  type = string  
  default = "us-west-1"
}

variable "az1" {
  description = "AWS us-west-1a availabity zone"
  type = string  
  default = "us-west-1a"
}

variable "public_key" {
  description = "Public key used to login into EC2 instances"
  type = string  
  sensitive = true
}
