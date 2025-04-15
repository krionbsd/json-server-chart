# JSON Server Helm Chart

A Helm chart for deploying [json-server](https://github.com/typicode/json-server) with MinIO integration.

## Features

- Deploys json-server with a MinIO backend for storing db.json
- Supports multiple environments (dev/prod) via Terraform
- Includes CI/CD pipeline with GitHub Actions
- Optional Ingress support

## Usage

### Local Development

```bash
# Deploy dev environment
cd terraform/environments/dev
terraform init
terraform apply

# Deploy prod environment
cd terraform/environments/prod
terraform init
terraform apply
```

### CI/CD

The GitHub Actions workflow automatically:
- Validates Terraform and Helm configurations
- Tests deployment in a Kind cluster
- Supports multiple environments

## Security

Sensitive data is managed via:
- Kubernetes secrets for MinIO credentials
- Terraform variables marked as sensitive
- GitHub Secrets for CI/CD
