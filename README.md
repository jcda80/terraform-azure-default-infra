# terraform-azure-default-infra

## infra.tf
- Cria o Resource Group
- Cria um Storage Account
- Provisiona a VNET de DEV (com as subnets External, Internal e Data)
- Provisiona a VNET de STG (com as subnets External, Internal e Data)
- Provisiona a VNET de PRD (com as subnets External, Internal e Data)

## vms.tf
- Cria a máquina virtual 
- Cria os discos da máquina virtual
- Cria os endereços IP público e privado

## variables.tf
- Definição das variáveis usadas nos demais arquivos
