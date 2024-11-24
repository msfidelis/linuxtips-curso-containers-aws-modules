##### Configurações Gerais #####

variable "project_name" {
  description = "Nome do projeto, utilizado para nomear e identificar os recursos criados pelo Terraform dentro do escopo deste cluster ECS."
  type        = string
}

variable "region" {
  description = "Região da AWS onde os recursos do cluster ECS e suas dependências serão provisionados."
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o cluster ECS e seus recursos associados serão implantados."
  type        = string
}

variable "private_subnets" {
  description = "Lista de IDs das sub-redes privadas dentro da VPC onde serão provisionados recursos como tasks ECS sem exposição pública."
  type        = list(string)
}

variable "public_subnets" {
  description = "Lista de IDs das sub-redes públicas dentro da VPC onde serão provisionados recursos que necessitam de acesso à Internet, como load balancers."
  type        = list(string)
}

##### Configurações do ECS #####

variable "capacity_providers" {
  description = "Lista de capacity providers que o cluster ECS irá utilizar. Por padrão, inclui FARGATE e FARGATE_SPOT para tasks gerenciadas por serverless."
  type        = list(any)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "acm_certs" {
  description = "Lista de ARNs de certificados ACM que serão associados a recursos como load balancers no cluster ECS. Caso não sejam especificados, será usada a configuração padrão vazia."
  type        = list(string)
  default     = []
}
