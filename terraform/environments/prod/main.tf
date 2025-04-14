terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.36.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "json_server" {
  source = "../../modules/json-server"

  release_name     = "json-server"
  chart_path       = "../../../"
  namespace        = "prod"
  replica_count    = 3
  image_repository = "local/json-server"
  image_tag        = "0.17.4"

  minio_mode               = "standalone"
  minio_replicas           = 4
  minio_persistence_enabled = true
  minio_memory             = "1Gi"
  minio_cpu                = "500m"
  minio_bucket             = "json-data"
  minio_file               = "db.json"

  minio_root_user     = var.minio_root_user
  minio_root_password = var.minio_root_password
  minio_access_key    = var.minio_access_key
  minio_secret_key    = var.minio_secret_key
}
