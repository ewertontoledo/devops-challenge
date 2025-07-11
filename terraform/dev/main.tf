# Configuração do provider AzureRM para Terraform
provider "azurerm" {
  features {} 
}

# Chamada do módulo que provisiona a infraestrutura Azure Kubernetes Stack
module "azure_kubernetes_stack" {
  source              = "../modules/azure_kubernetes_stack"  # Caminho relativo para o módulo
  prefix              = var.prefix                          
  location            = var.location                       
  resource_group_name = var.resource_group_name             
  aks_node_count      = var.aks_node_count                  
  aks_node_vm_size    = var.aks_node_vm_size                
}
