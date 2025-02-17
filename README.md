# Projeto Challenge Aquarela

Este repositório contém o código e a configuração para o projeto Challenge Aquarela, que utiliza várias tecnologias para implementar uma infraestrutura em nuvem e serviços.

## Tecnologias e Ferramentas Utilizadas

### 1. **Terraform**
- **Descrição**: Terraform é uma ferramenta de infraestrutura como código (IaC) que permite provisionar e gerenciar recursos em nuvem.
- **Uso**: Utilizado para criar e gerenciar a infraestrutura na AWS, incluindo buckets S3, tabelas DynamoDB e instâncias EC2.
- **Documentação**: [Terraform Documentation](https://www.terraform.io/docs)

### 2. **AWS (Amazon Web Services)**
- **Descrição**: Uma plataforma de serviços em nuvem que fornece infraestrutura de computação, armazenamento e rede.
- **Serviços Utilizados**:
  - **S3**: Armazenamento de objetos.
  - **DynamoDB**: Banco de dados NoSQL.
  - **EC2**: Instâncias de computação.
- **Documentação**: [AWS Documentation](https://aws.amazon.com/documentation/)

### 3. **Kubernetes**
- **Descrição**: Um sistema de orquestração de contêineres que automatiza a implantação, escalonamento e gerenciamento de aplicativos em contêineres.
- **Uso**: Utilizado para gerenciar a infraestrutura de contêineres, incluindo o CoreDNS para resolução de nomes.
- **Documentação**: [Kubernetes Documentation](https://kubernetes.io/docs/home/)

### 4. **LocalStack**
- **Descrição**: Uma ferramenta que simula serviços da AWS localmente, permitindo o desenvolvimento e testes sem a necessidade de acessar a nuvem.
- **Uso**: Utilizado para testar a infraestrutura do Terraform em um ambiente local.
- **Documentação**: [LocalStack Documentation](https://localstack.cloud/)

### 5. **GitHub Actions**
- **Descrição**: Uma plataforma de integração contínua e entrega contínua (CI/CD) que permite automatizar o fluxo de trabalho de desenvolvimento.
- **Uso**: Utilizado para automatizar o processo de implantação e testes do projeto.
- **Documentação**: [GitHub Actions Documentation](https://docs.github.com/en/actions)

### Explicação dos Componentes:
- **`.github/workflows`**: Configurações de automação do GitHub Actions.
- **`apps`**: Configurações de aplicativos Kubernetes (ArgoCD e Bitwarden).
- **`terraform`**: Infraestrutura como código para recursos AWS.
- **`commands_terminal.txt`**: Lista de comandos úteis para operações locais.

## 🔮 Melhorias Futuras

### **1. Segurança Avançada**
- **IAM Granular**  
  Implementar políticas de IAM com condições baseadas em tags e princípio do menor privilégio.
- **Gestão de Secrets**  
  Migrar para [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) ou [HashiCorp Vault](https://www.vaultproject.io/), eliminando credenciais em texto claro.

---

### **2. Automação e Observabilidade**
- **Pipeline Multi-Estágio**  
  Adicionar ambientes de `staging` e `prod` com aprovação manual via [GitHub Environments](https://docs.github.com/en/actions/deployment/targeting-different-environments).
- **Health Checks no ArgoCD**  
  Configurar [probes customizados](https://argo-cd.readthedocs.io/en/stable/operator-manual/health/) para monitorar aplicações e rollback automático.
- **Dashboard Unificado**  
  Centralizar métricas do LocalStack/k3d no [Grafana](https://grafana.com/) + [Prometheus](https://prometheus.io/).

---

### **3. Otimização de Custos e Performance**
- **Cleanup Automático**  
  Agendar jobs diários para remover recursos não produtivos no LocalStack (ex: buckets S3 temporários).
- **Auto-Scaling do k3d**  
  Implementar escalonamento automático de nodes com [`k3d autoscale`](https://k3d.io/v5.5.1/usage/commands/#cluster-create).

---
