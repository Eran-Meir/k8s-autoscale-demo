variable "namespace_name" {
  description = "The name of the Kubernetes namespace to create"
  type        = string
  default     = "autoscale-demo"
}

variable "location" {
  description = "The location/region (not used for Minikube, but good practice)"
  type        = string
  default     = "local"
}
