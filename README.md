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
