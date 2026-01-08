# This tells Terraform to talk to the Minikube running on the machine

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "autoscale-demo"
  }
}
