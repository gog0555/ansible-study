variable "env" {
  type    = string
  default = "env"
}

variable "name" {
  type    = string
  default = "name"
}

variable "cidr_block" {
  type    = string
  default = "cidr_block"
}

variable "instance_ami" {
  type    = string
  default = "ami-03a1b4db103179555"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
