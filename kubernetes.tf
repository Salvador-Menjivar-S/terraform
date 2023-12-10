# Kubernetes Deployment for Backend Service
resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        # Define the containers for your backend service
        container {
          name  = "backend-container"
          image = "your-registry/backend-image:latest"
          # Additional container configurations
        }
      }
    }
  }
}

# Define a Kubernetes Service for Backend Service
resource "kubernetes_service" "backend" {
  metadata {
    name = "backend-service"
  }

  spec {
    selector = {
      app = "backend"
    }

    # Define the ports for your backend service
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080  # Adjust based on your backend application's port
    }
  }
}

# Define a Kubernetes Deployment for Frontend Service
resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        # Define the containers for your frontend service
        container {
          name  = "frontend-container"
          image = "your-registry/frontend-image:latest"
          # Additional container configurations
        }
      }
    }
  }
}

# Define a Kubernetes Service for Frontend Service
resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend-service"
  }

  spec {
    selector = {
      app = "frontend"
    }

    # Define the ports for your frontend service
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080  # Adjust based on your frontend application's port
    }
  }
}
