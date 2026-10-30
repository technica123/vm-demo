
variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_types" {
  type = map(string)

  default = {
    jenkins = "t3.micro"
    storage = "t3.micro"
    ingest  = "t3.micro"
    query   = "t3.micro"
  }
}
