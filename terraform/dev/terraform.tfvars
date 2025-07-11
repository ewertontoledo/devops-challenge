prefix              = "devops-dev"     # Prefixo usado para nomear recursos no Azure
location            = "eastus"         # Região do Azure onde os recursos serão criados
resource_group_name = "rg-devops-dev"  # Nome do Resource Group para agrupar os recursos
aks_node_count      = 1                # Quantidade de nós (máquinas) no cluster AKS
aks_node_vm_size    = "Standard_B2s"   # Tamanho da máquina virtual usada nos nós do AKS
