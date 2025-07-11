# 🚀 DevOps Challenge

Este repositório contém uma solução DevOps  
simples para deploy de uma aplicação web para o desafio técnico de **Analista DevOps Pleno**, incluindo:

- Aplicação Node.js 
- Dockerfile com build multi-stage e healthcheck
- Infraestrutura provisionada via Terraform no Azure (AKS + ACR + RG)
- Deploy com Helm Charts usando ConfigMap e Secret
- CI/CD automatizado com Azure DevOps YAML Pipeline

---
## ⚙️ Pré-Requisitos

Para rodar localmente (Linux ou Windows), instale:

- [Node.js 18+](https://nodejs.org/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Terraform CLI](https://developer.hashicorp.com/terraform)
- [Helm CLI](https://helm.sh/docs/intro/install/)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Git](https://git-scm.com/)

---

## ▶️ Executando a Aplicação Localmente

### 🐳 Via Docker
1. Navegue até a pasta da aplicação:

cd devops-challenge/app

2. Construa a imagem Docker:

docker build -t devops-challenge .

3. Execute o container:

docker run -p 8080:8080 devops-challenge

4. Acesse no navegador:

- http://localhost:8080/
- http://localhost:8080/health — deve retornar JSON { "status": "UP" }

5. ✅ Verifique o health check da aplicação:

> **Para testar a requisição no Postman**, você pode usar o comando cURL copiado para o Postman com o recurso “Import” > “Raw Text”.  
> Aqui está o comando completo para colar: curl --location --request GET 'http://localhost:8080/health'
---

## ☁️ Provisionando Infraestrutura com Terraform

## ✅ Requisitos
Terraform CLI 1.5+
Azure CLI autenticado
Permissões para criar RG, ACR e AKS no Azure

## 🚀 Como usar
1. Autentique-se no Azure:
  
  az login

2. Entre na pasta do ambiente que deseja testar (dev, hml, etc):

  cd terraform/dev
  ou
  cd terraform/hml

3. Inicialize o Terraform:
  terraform init

4. Visualize o plano de execução:
  terraform plan

5. Aplique a infraestrutura:
  terraform apply -auto-approve

🧹 Destruir os recursos
Caso queira remover tudo:
  terraform destroy -auto-approve

---

## 🔧 Validar Helm

Antes de aplicar o Helm Chart no cluster, você pode realizar testes locais para verificar se os templates estão válidos.

- `helm template ./helm`  
  Gera e exibe os manifests Kubernetes a partir dos charts Helm, sem aplicar nada no cluster. Útil para revisar o YAML gerado.

- `helm lint ./helm`  
  Verifica a sintaxe e estrutura do chart Helm, identificando erros e inconsistências antes do deploy.

Para validar os charts, execute os comandos abaixo a partir da raiz do projeto (devops-challenge>):

1. helm template ./helm

2. helm lint ./helm
---

## 🚧 Pipeline CI/CD

Esta pipeline está configurada para **buildar a imagem Docker e testar a aplicação localmente**, garantindo que tudo funcione antes de qualquer implantação.

> ⚠️ **Atenção:**  
> Atualmente, **o deploy automático no Azure não está ativado/ligado**.  
> O arquivo `azure-pipelines.yml` está estruturado para realizar o deploy no Azure Kubernetes Service (AKS) usando Helm, mas essa etapa está desabilitada para rodar automaticamente. 

Você pode usar a pipeline do GitHub Actions para validar localmente e o Azure DevOps para orquestrar o deploy completo, conforme sua necessidade.


## 📌 Observações
- O Dockerfile utiliza multi-stage build para separar a etapa de build da etapa final de execução.
- Isso resulta em uma imagem final mais leve e mais rápida para subir e rodar.
- O Helm chart usa _helpers.tpl para centralizar funções e templates reutilizáveis, facilitando a manutenção e evitando repetição.
- ConfigMap e Secret foram usados para separar configurações da aplicação e dados sensíveis, melhorando segurança e flexibilidade.
- O Service expõe a aplicação dentro do cluster Kubernetes, permitindo comunicação e balanceamento de carga.
- O values.yaml oferece parametrização fácil e personalizável do chart, permitindo ajustes sem alterar o código dos templates.