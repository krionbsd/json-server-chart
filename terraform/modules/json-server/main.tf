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

  set {
    name  = "ingress.enabled"
    value = var.ingress_enabled
  }

  set {
    name  = "ingress.className"
    value = var.ingress_class_name
  }

  dynamic "set" {
    for_each = var.ingress_annotations
    content {
      name  = "ingress.annotations.${set.key}"
      value = set.value
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? range(length(var.ingress_hosts)) : []
    content {
      name  = "ingress.hosts[${set.value}].host"
      value = var.ingress_hosts[set.value].host
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? flatten([
      for host_idx, host in var.ingress_hosts : [
        for path_idx, path in host.paths : {
          host_idx = host_idx
          path_idx = path_idx
          path     = path.path
          pathType = path.pathType
        }
      ]
    ]) : []
    content {
      name  = "ingress.hosts[${set.value.host_idx}].paths[${set.value.path_idx}].path"
      value = set.value.path
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? flatten([
      for host_idx, host in var.ingress_hosts : [
        for path_idx, path in host.paths : {
          host_idx = host_idx
          path_idx = path_idx
          path     = path.path
          pathType = path.pathType
        }
      ]
    ]) : []
    content {
      name  = "ingress.hosts[${set.value.host_idx}].paths[${set.value.path_idx}].pathType"
      value = set.value.pathType
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? range(length(var.ingress_tls)) : []
    content {
      name  = "ingress.tls[${set.value}].secretName"
      value = var.ingress_tls[set.value].secretName
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? flatten([
      for tls_idx, tls in var.ingress_tls : [
        for host_idx, host in tls.hosts : {
          tls_idx  = tls_idx
          host_idx = host_idx
          host     = host
        }
      ]
    ]) : []
    content {
      name  = "ingress.tls[${set.value.tls_idx}].hosts[${set.value.host_idx}]"
      value = set.value.host
    }
  }
}
