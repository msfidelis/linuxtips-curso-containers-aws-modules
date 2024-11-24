variable "project_name" {
  description = "Nome do projeto. Essa variável será usada como prefixo para identificar os recursos criados dentro desse projeto."
}

variable "region" {
  description = "Região da AWS onde os recursos da VPC serão provisionados. Por padrão, é a região configurada no provider."
}

variable "cidr" {
  description = "Bloco CIDR principal para a VPC, definindo o intervalo de endereços IP que a VPC pode usar."
  type        = string
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade (AZs) da AWS onde as sub-redes serão criadas. Cada sub-rede estará associada a uma AZ específica."
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de configurações para as sub-redes privadas, incluindo nome, bloco CIDR e zona de disponibilidade associada."
  type        = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "public_subnets" {
  description = "Lista de configurações para as sub-redes públicas, incluindo nome, bloco CIDR e zona de disponibilidade associada."
  type        = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}
