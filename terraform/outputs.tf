output "namespace" {
  description = "The namespace that was created"
  value       = kubernetes_namespace_v1.demo.metadata[0].name
}

output "status" {
  description = "Status of the namespace"
  value       = kubernetes_namespace_v1.demo.metadata[0].generation
}
