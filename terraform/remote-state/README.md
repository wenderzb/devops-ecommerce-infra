Rodar antes de iniciar o provisionamento para que seja criado o bucket s3 que servirá de backend (armazenamento do state) do terraform

Como estarão rodando local depois de configurado o profile (sso), entre uma execução e outra será necessário remover os arquivos abaixo:
>rm -r .terraform .terraform.lock.hcl terraform.tfstate 

    terraform init
    terraform plan 
    terraform apply 

Exemplo de arquivo backend.tf 

terraform {
  backend "s3" {
    
  }
}
