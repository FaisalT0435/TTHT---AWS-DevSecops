# AWS DevSecOps Infrastructure with Terraform

Deployment of a scalable CI/CD pipeline using AWS native services (ECS Fargate, CodeBuild, CodePipeline, and ALB).

## Architecture
The infrastructure consists of:
- **Networking**: VPC with isolated public/private subnets.
- **Compute**: ECS Fargate for serverless container execution.
- **Traffic**: ALB for distribution and health monitoring.
- **CI/CD**: Fully automated pipeline from GitHub source to ECS deployment.

## 🔄 CI/CD Workflow

### 1. Infrastructure CI (GitHub Actions)
Setiap kali ada `push` atau `Pull Request` ke branch `main`, GitHub Actions akan menjalankan:
- **Format Check**: Memastikan penulisan kode sesuai standar HCL.
- **Validation**: Mengecek integritas sintaks Terraform.

### 2. Application CI/CD (AWS CodePipeline)
Setelah kode masuk ke branch `main`, pipeline AWS akan terpicu secara otomatis:
1. **Source Stage**: Mengambil kode terbaru dari GitHub.
2. **Build Stage (CodeBuild)**:
   - Login ke Amazon ECR.
   - Build Docker Image dari `Dockerfile`.
   - Push Image ke ECR Repository.
   - Generate `imagedefinitions.json`.
3. **Deploy Stage (ECS)**:
   - Mengambil image terbaru dari ECR.
   - Melakukan *Rolling Update* pada ECS Service tanpa downtime.

## Directory Structure
- `modules/`: Contains reusable infrastructure components.
- `main.tf`: Root configuration orchestrating all modules.
- `variables.tf`: Input variable definitions.
- `outputs.tf`: Key infrastructure exports.

## Getting Started

### Prerequisites
- Terraform v1.0+
- AWS CLI installed and configured
- GitHub PAT (Personal Access Token)

### Installation & Setup
1. **Install AWS CLI**: 
   Download and run the installer from the [Official AWS Page](https://aws.amazon.com/cli/).
2. **Configure AWS Credentials**:
   ```bash
   aws configure
   ```
   *Enter your AWS Access Key ID, Secret Access Key, and default region (`ap-southeast-3`).*

### Usage
1. Initialize the project:
   ```bash
   terraform init
   ```

2. Configure your variables in `terraform.tfvars`.

3. Review the plan:
   ```bash
   terraform plan
   ```

4. Apply changes:
   ```bash
   terraform apply
   ```

## Security Implementation
- Tasks are hosted in private subnets with no direct internet access.
- Security Groups follow the principle of least privilege.
- Sensitive variables are marked as `sensitive = true`.