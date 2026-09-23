# Laboratorio 04 – IaC con Terraform y Docker

Despliegue de dos entornos aislados (DEV y QA) con Terraform y el provider `kreuzwerker/docker`. Cada entorno tiene su propia red y tres contenedores: Frontend (nginx), Backend (node) y BD (postgres).

## Requisitos
- Docker Desktop en ejecución
- Terraform
- Git
- VS Code con la extensión HashiCorp Terraform

## 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/lab04-iac.git
cd lab04-iac
```

## 2. Entrar a la carpeta del código
```bash
cd iac
```

## 3. Inicializar Terraform
Descarga el provider `kreuzwerker/docker` versión `4.6.0`.
```bash
terraform init
```

## 4. Desplegar el entorno DEV
```bash
terraform workspace new dev
terraform plan
terraform apply
```
Escribe `yes` para confirmar.

## 5. Desplegar el entorno QA
```bash
terraform workspace new qa
terraform plan
terraform apply
```
Escribe `yes` para confirmar.

> Si los workspaces ya existen, usa `terraform workspace select dev` o `terraform workspace select qa` en lugar de `new`.