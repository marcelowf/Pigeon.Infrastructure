# Pigeon.Infrastructure

[![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/) [![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=&logoColor=white)](https://azure.microsoft.com/) [![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-0078D7?style=for-the-badge&logo=&logoColor=white)](https://azure.microsoft.com/services/devops/) [![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)](https://git-scm.com/)

IaC para recursos Azure usados pelo projeto Pigeon. Este repositório contém os módulos e configurações Terraform para provisionar Pigeon Azure Functions.

#### 📚 Visão Geral

Este projeto utiliza Terraform para provisionar:

- App Service Plan
- Azure Function Apps
- Storage Account
- Azure Service Bus Namespace
- Azure Service Bus Queues
- Application Insights

#### 🗂️ Estrutura do Projeto

- Configuration.AzureDevOps — Contains YAML pipeline definitions for Azure DevOps, automating provisioning and deployment processes for the Pigeon platform.

- Pigeon.Foundation — Defines the core infrastructure modules (e.g., storage, service bus, key vault) used across Pigeon projects, acting as the foundation layer for provisioning.

- Pigeon.Skeletons — Reusable Terraform module templates for common Azure resources, designed to simplify and standardize infrastructure provisioning across Pigeon services.
- 
 #### 🧠 Como Usar

Para utilizar este repositório, siga os passos abaixo:

1. **Clone o repositório:**

    ```bash
    git clone https://github.com/marcelowf/Pigeon.Infrastructure.git
    ```

2. **Importe para o seu Azure DevOps.**

3. **Defina seu grupo de variáveis:** Navegue até **Pipelines** => **Library** no Azure DevOps e crie um novo grupo de variáveis com os seguintes campos:
    - `bkstrg`
    - `bkstrgrg`
    - `env_suffix`
    - `service_connection_name`
    - `subscription_id`

    Após definir essas variáveis, **altere o nome do grupo de variáveis** no arquivo YAML localizado em `Configuration.AzureDevOps` para o nome que você definiu.

4. **Defina uma nova pipeline:** Crie uma nova pipeline e utilize o arquivo YAML encontrado em `Configuration.AzureDevOps`.

5. **Execute a pipeline.**

#### 📝 Licença

Este projeto está sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.

#### 👤 Autores e Contato

LinkedIn: [Marcelo Wzorek Filho](https://www.linkedin.com/in/marcelo-wzorek-filho-132228255/)
E-mail: <marcelo.projects.dev@gmail.com>
GitHub: [marcelowf](https://github.com/marcelowf)

#### 🏷️ Tags

`Pigeon` `Microsserviços` `Mensageria` `Monitoramento` `Automação` `Azure` `AzureDevOps` `Terraform` `CI/CD`
