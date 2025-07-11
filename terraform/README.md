# ☁️ Terraform - Provisionamento de Infraestrutura no Azure

Este módulo Terraform provisiona toda a infraestrutura necessária para o **DevOps Challenge**, incluindo:

- **Resource Group**
- **Azure Container Registry (ACR)**
- **Azure Kubernetes Service (AKS)**

## 📁 Estrutura do módulo

terraform/
├── dev/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── hml/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
└── modules/
    └── azure_kubernetes_stack/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── README.md

## 🔧 Como funciona
Os diretórios dev/ e hml/ são ambientes isolados, que chamam o módulo azure_kubernetes_stack para provisionar a infraestrutura com configurações específicas.

O módulo azure_kubernetes_stack contém o código que cria:

    - Resource Group
    - Azure Container Registry (ACR)
    - Azure Kubernetes Service (AKS)

## ⚙️ Configuração dos ambientes

Cada ambiente (dev ou hml) possui seus próprios arquivos:

    - main.tf — provedor e chamada do módulo
    - variables.tf — variáveis específicas do ambiente
    - outputs.tf — outputs para o ambiente
    - terraform.tfvars — valores das variáveis

Obs.: Não adicionado ambiente de produção.

## 📦 Recursos Provisionados pelo Módulo

    - Resource Group (azurerm_resource_group)
    - Azure Container Registry (ACR) (azurerm_container_registry)
    - Azure Kubernetes Service (AKS) (azurerm_kubernetes_cluster)

## 📤 Outputs Comuns (disponíveis via módulo)

| Nome                  | Descrição                                |
| --------------------- | ---------------------------------------- |
| `resource_group_name` | Nome do Resource Group criado            |
| `acr_login_server`    | URL de login do Azure Container Registry |
| `aks_cluster_name`    | Nome do cluster AKS criado               |

## ⚙️ Variáveis Comuns

| Nome                  | Tipo   | Padrão              | Descrição                            |
| --------------------- | ------ | ------------------- | ------------------------------------ |
| `prefix`              | string | `devopschallenge`   | Prefixo usado nos nomes dos recursos |
| `location`            | string | `eastus`            | Região Azure para provisionamento    |
| `resource_group_name` | string | Ex: `rg-devops-dev` | Nome do Resource Group               |
| `aks_node_count`      | number | 1                   | Número de nós do cluster AKS         |
| `aks_node_vm_size`    | string | `Standard_DS2_v2`   | Tipo de VM para os nós do AKS        |

## 📌 Observações sobre a Estrutura do Projeto

- Isolamento de ambientes:
Cada ambiente (dev, hml) tem sua própria pasta com configurações específicas (variáveis, terraform.tfvars , etc), permitindo deploys independentes e seguros.

- Reuso de código com módulos:
O código real de provisionamento da infraestrutura está no módulo azure_kubernetes_stack. Isso facilita manutenção, padronização e evita duplicação.

- Facilidade para escalar:
É simples adicionar novos ambientes, como prd, criando uma nova pasta e apenas ajustando variáveis e configurações específicas.

- Separação clara de responsabilidades:
A equipe pode trabalhar separadamente nos ambientes, minimizando conflitos e riscos de alterar o ambiente errado.

- Flexibilidade para customizações:
Cada ambiente pode ter variações de parâmetros (ex: número de nós AKS, tamanho das VMs, nomes, localização) sem impactar outros ambientes.

- Boas práticas recomendadas pela HashiCorp:
Modularizar e parametrizar infraestrutura é a melhor prática para projetos Terraform profissionais e escaláveis.