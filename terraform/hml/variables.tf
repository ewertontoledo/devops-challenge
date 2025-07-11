# Variável para definir o prefixo usado na nomenclatura dos recursos no Azure
variable "prefix" {
  description = "Prefixo para nomes dos recursos"
  type        = string
}

# Variável que define a região do Azure onde os recursos serão provisionados
variable "location" {
  description = "Região do Azure"
  type        = string
}

# Variável para o nome do Resource Group que agrupa os recursos
variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

# Variável que determina o número de nós no cluster AKS
variable "aks_node_count" {
  description = "Número de nós do AKS"
  type        = number
}

# Variável para definir o tamanho da VM usada nos nós do cluster AKS
variable "aks_node_vm_size" {
  description = "Tamanho da VM para os nós do AKS"
  type        = string
}

