locals {
  # Define your 3 control plane nodes here. 
  # Assign these IPs as static leases in your Unifi controller matching the MACs.
  nodes = {
    "cbr-hill-k8s-cp-01" = { ip = "10.1.10.11", mac = "BC:24:11:00:00:01" }
    "cbr-hill-k8s-cp-02" = { ip = "10.1.10.12", mac = "BC:24:11:00:00:02" }
    "cbr-hill-k8s-cp-03" = { ip = "10.1.10.13", mac = "BC:24:11:00:00:03" }
  }
  cluster_name     = "cbr-hill-k8s-cluster-01"
  cluster_endpoint = "https://10.1.10.11:6443" #Using the first node as the API endpoint
}

resource "proxmox_virtual_environment_vm" "talos_cp" {
  for_each  = local.nodes
  name      = each.key
  node_name = "cbr-hill-hypervisor-01"

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "virtio0"
    size         = 20
  }

  network_device {
    bridge      = "vmbr0"
    mac_address = each.value.mac
  }

  cdrom {
    enabled   = true
    file_id   = "local:iso/talos-amd64.iso"
    interface = "ide0"
  }

  operating_system {
    type = "l26" # Linux kernel
  }

  # Ensure the VM boots from the Talos ISO first, then the hard drive
  initialization {
    datastore_id = "local-lvm"
  }
}
