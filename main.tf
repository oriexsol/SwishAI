provider "kubernetes" {
  config_path    = "~/.kube/config"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}

resource "kubernetes_deployment" "swishai" {
  metadata {
    name = "swishai"
    labels = {
      App = "Swishai"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "swishai"
      }
    }
    template {
      metadata {
        labels = {
          App = "swishai"
        }
      }
      spec {
        container {
          image = "oriexsol/swishai:latest"
          name  = "swishai"

          port {
            container_port = 80
          }

          }
        }
      }
    }
  }
resource "kubernetes_service" "swishai_service" {
  metadata {
    name = "swishai-service"
  }
  spec {
    selector = {
      App = "swishai"
    }
    port {
      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
