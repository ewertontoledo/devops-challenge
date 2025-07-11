# Output que expõe o nome do Resource Group criado pelo módulo
output "resource_group_name" {
  value = module.azure_kubernetes_stack.resource_group_name
}

# Output que fornece a URL de login do Azure Container Registry criado pelo módulo
output "container_registry_login_server" {
  value = module.azure_kubernetes_stack.acr_login_server
}

# Output que expõe o nome do cluster AKS criado pelo módulo
output "aks_cluster_name" {
  value = module.azure_kubernetes_stack.aks_cluster_name
}