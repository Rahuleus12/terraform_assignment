variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = ""
  description = "The name of the key pair to use for SSH access to the instance"
}
