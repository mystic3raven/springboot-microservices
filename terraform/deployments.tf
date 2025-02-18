resource "kubernetes_deployment" "product_service" {
  metadata {
    name      = "product-service"
    namespace = "default"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "product-service"
      }
    }

    template {
      metadata {
        labels = {
          app = "product-service"
        }
      }

      spec {
        service_account_name = kubernetes_service_account.eks_admin.metadata[0].name
        container {
          image = "com.example/product-service:latest"
          name  = "product-service"

          port {
            container_port = 8081
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "review_service" {
  metadata {
    name      = "review-service"
    namespace = "default"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "review-service"
      }
    }

    template {
      metadata {
        labels = {
          app = "review-service"
        }
      }

      spec {
        service_account_name = kubernetes_service_account.eks_admin.metadata[0].name
        container {
          image = "com.example/review-service:latest"
          name  = "review-service"

          port {
            container_port = 8082
          }
        }
      }
    }
  }
}
