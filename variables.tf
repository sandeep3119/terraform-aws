variable "ami" {
  type = string
  default = "ami-06c68f701d8090592"
}

variable "instance-type" {
  type = string
  default = "t2.micro"
}

variable "db_name" {
  type = string
  default = "appdb"
}