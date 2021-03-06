terraform {
  required_version = ">= 0.13"
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "3.8.0"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.17.1"
    }
  }
}
