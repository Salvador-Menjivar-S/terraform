

provider "google" {
  project = "smenjivar-dev"
  region  = "us-central1"
}


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




