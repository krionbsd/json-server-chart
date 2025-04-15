variable "release_name" {
  description = "Name of the Helm release"
  type        = string
}

variable "chart_path" {
  description = "Path to the Helm chart"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
}

variable "replica_count" {
  description = "Number of replicas"
  type        = number
}

variable "image_repository" {
  description = "Docker image repository"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
}

variable "minio_mode" {
  description = "MinIO deployment mode"
  type        = string
}

variable "minio_replicas" {
  description = "Number of MinIO replicas"
  type        = number
}

variable "minio_persistence_enabled" {
  description = "Enable MinIO persistence"
  type        = bool
}

variable "minio_memory" {
  description = "MinIO memory"
  type        = string
}

variable "minio_cpu" {
  description = "MinIO CPU"
  type        = string
}

variable "minio_bucket" {
  description = "MinIO bucket name"
  type        = string
}

variable "minio_file" {
  description = "MinIO file name"
  type        = string
}

variable "minio_root_user" {
  description = "MinIO root user"
  type        = string
  sensitive   = true
}

variable "minio_root_password" {
  description = "MinIO root password"
  type        = string
  sensitive   = true
}

variable "minio_access_key" {
  description = "MinIO access key"
  type        = string
  sensitive   = true
}

variable "minio_secret_key" {
  description = "MinIO secret key"
  type        = string
  sensitive   = true
}

variable "ingress_enabled" {
  description = "Enable Ingress"
  type        = bool
  default     = false
}

variable "ingress_class_name" {
  description = "Ingress class name"
  type        = string
  default     = ""
}

variable "ingress_annotations" {
  description = "Ingress annotations"
  type        = map(string)
  default     = {}
}

variable "ingress_hosts" {
  description = "Ingress hosts configuration"
  type = list(object({
    host = string
    paths = list(object({
      path     = string
      pathType = string
    }))
  }))
  default = []
}

variable "ingress_tls" {
  description = "Ingress TLS configuration"
  type = list(object({
    secretName = string
    hosts      = list(string)
  }))
  default = []
}
