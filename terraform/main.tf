provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace_v1" "demo" {
  metadata {
    # references the variable from variables.tf
    name = var.namespace_name
  }
}