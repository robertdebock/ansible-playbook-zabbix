<<<<<<< HEAD
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.13.2"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.3.0"
    }
  }
  required_version = ">= 0.13"
=======
# cloudflare
variable "cloudflare_api_token" {}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "digitalocean" {
  token = var.do_token
>>>>>>> f6dbc31f2fe5704d06e226c7fa0ec235506627d7
}


