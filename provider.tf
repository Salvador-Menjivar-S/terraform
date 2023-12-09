# https://registry.terraform.io/providers/hashicorp/google/latest/docs


provider "google" {
  credentials = jsondecode(var.gcp_sa_key)
  project = "smenjivar-dev"
  region  = "us-central1"
}

provider "github" {
  token = var.gh_token
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "web-app-tf-staging"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}




