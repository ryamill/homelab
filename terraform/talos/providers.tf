terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.60.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "~> 0.6.0"
    }
  }
}

provider "proxmox" {
  endpoint  = "10.1.1.43:8006/"
  api_token = "YOUR_TOKEN_ID=YOUR_SECRET"
  insecure  = true # Set to false if you have a valid SSL cert on Proxmox
}
