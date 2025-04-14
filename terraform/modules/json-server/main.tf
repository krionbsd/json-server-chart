resource "helm_release" "json_server" {
  name             = var.release_name
  chart            = var.chart_path
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  set {
    name  = "image.repository"
    value = var.image_repository
  }

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "minio.enabled"
    value = true
  }

  set {
    name  = "minio.mode"
    value = var.minio_mode
  }

  set {
    name  = "minio.replicas"
    value = var.minio_replicas
  }

  set {
    name  = "minio.persistence.enabled"
    value = var.minio_persistence_enabled
  }

  set {
    name  = "minio.resources.requests.memory"
    value = var.minio_memory
  }

  set {
    name  = "minio.resources.requests.cpu"
    value = var.minio_cpu
  }

  set {
    name  = "minio.bucket"
    value = var.minio_bucket
  }

  set {
    name  = "minio.file"
    value = var.minio_file
  }

  set_sensitive {
    name  = "minio.accessKey"
    value = var.minio_access_key
  }

  set_sensitive {
    name  = "minio.secretKey"
    value = var.minio_secret_key
  }

  set_sensitive {
    name  = "minio.rootUser"
    value = var.minio_root_user
  }

  set_sensitive {
    name  = "minio.rootPassword"
    value = var.minio_root_password
  }
}
