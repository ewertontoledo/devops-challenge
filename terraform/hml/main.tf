# Configuração do provider AzureRM para autenticar e gerenciar recursos no Azure
provider "azurerm" {
  features {}  
}

# Chamada do módulo que provisiona toda a infraestrutura AKS e ACR
module "azure_kubernetes_stack" {
  source              = "../modules/azure_kubernetes_stack"  # Caminho para o módulo reutilizável
  prefix              = var.prefix                           
  location            = var.location                         
  resource_group_name = var.resource_group_name              
  aks_node_count      = var.aks_node_count                   
  aks_node_vm_size    = var.aks_node_vm_size                 
}


