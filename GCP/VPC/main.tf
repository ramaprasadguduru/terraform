terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
 credentials = file("C:/Users/Public/gcpcredentials/active-cirrus-328217-7e8d5ad23ad9.json")
 project = "active-cirrus-328217"
  region  = "us-central1"
  zone    = "us-central1-c"

}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}