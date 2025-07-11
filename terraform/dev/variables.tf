# Prefixo que será usado para nomear os recursos criados no Azure
variable "prefix" {
  description = "Prefixo para os nomes dos recursos"
  type        = string
  default     = "devopsdemo"
}

# Região do Azure onde os recursos serão provisionados
variable "location" {
  description = "Região do Azure para os recursos"
  type        = string
  default     = "eastus"
}

# Nome do Resource Group onde os recursos serão agrupados
variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "rg-devopsdemo"
}

# Número de nós que o cluster AKS terá
variable "aks_node_count" {
  description = "Quantidade de nós no AKS"
  type        = number
  default     = 1
}

# Tamanho da máquina virtual utilizada para os nós do AKS
variable "aks_node_vm_size" {
  description = "Tamanho da VM dos nós do AKS"
  type        = string
  default     = "Standard_DS2_v2"
}

