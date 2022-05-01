variable "kubeconfig" {
  type = string
}

variable "image" {
  type = string
}

variable "port" {
  type = string
}

variable "replicas" {
  type = string
}

provider "kubernetes" {
  config_path    = var.kubeconfig
}

resource "kubernetes_deployment" "swishai" {
  metadata {
    name = "swishai"
    labels = {
      App = "Swishai"
    }
  }

  spec {
    replicas = var.replicas
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
          image = var.image
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
      node_port   = var.port
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}
