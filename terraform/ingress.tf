resource "kubernetes_ingress" "alb_ingress" {
  metadata {
    name      = "springboot-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class"           = "alb"
      "alb.ingress.kubernetes.io/scheme"      = "internet-facing"
      "alb.ingress.kubernetes.io/target-type" = "ip"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/product"
          backend {
            service_name = kubernetes_service.product_service.metadata[0].name
            service_port = 8081
          }
        }
        path {
          path = "/review"
          backend {
            service_name = kubernetes_service.review_service.metadata[0].name
            service_port = 8082
          }
        }
      }
    }
  }
}
