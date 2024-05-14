terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.28.0"
    }
  }
}

provider "google" {
  # Configuration options
  project      = "gcp-tutorial-project-1-417922"
  region       = "us-west2"
  zone         = "us-west2-a"
  credentials  = "gcp-tutorial-project-1-417922-9804b9dadedf.json"
  }