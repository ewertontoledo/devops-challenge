prefix              = "devops-hml"       # Prefixo usado para nomear os recursos no ambiente de homologação
location            = "brazilsouth"      # Região do Azure onde os recursos serão provisionados
resource_group_name = "rg-devops-hml"    # Nome do Resource Group para agrupar os recursos no ambiente homologação
aks_node_count      = 2                   # Número de nós no cluster AKS para homologação
aks_node_vm_size    = "Standard_DS2_v2"  # Tamanho da VM para os nós do cluster AKS