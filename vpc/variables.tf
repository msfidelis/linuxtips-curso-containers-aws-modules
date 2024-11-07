variable "project_name" {
  description = "Nome do projet. Essa variável será um prefixo para os recursos criados dentro desse projeto"
}

variable "region" {
  default = "Região da AWS onde os recursos serão criados"
}


variable "cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}