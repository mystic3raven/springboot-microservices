resource "kubernetes_service" "product_service" {
  metadata {
    name      = "product-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "product-service"
    }
    port {
      protocol    = "TCP"
      port        = 8081
      target_port = 8081
    }
  }
}

resource "kubernetes_service" "review_service" {
  metadata {
    name      = "review-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "review-service"
    }
    port {
      protocol    = "TCP"
      port        = 8082
      target_port = 8082
    }
  }
}
