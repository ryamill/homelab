locals {
  # Control Plane Nodes
  cp_nodes = {
    "cbr-hill-k8s-cp-01" = { ip = "10.1.10.21", mac = "BC:24:11:00:00:01" }
    "cbr-hill-k8s-cp-02" = { ip = "10.1.10.22", mac = "BC:24:11:00:00:02" }
    "cbr-hill-k8s-cp-03" = { ip = "10.1.10.23", mac = "BC:24:11:00:00:03" }
  }
  
  # Dedicated Worker Nodes
  worker_nodes = {
    "cbr-hill-k8s-worker-01" = { ip = "10.1.10.25", mac = "BC:24:11:00:01:01" }
    "cbr-hill-k8s-worker-02" = { ip = "10.1.10.26", mac = "BC:24:11:00:01:02" }
    "cbr-hill-k8s-worker-03" = { ip = "10.1.10.27", mac = "BC:24:11:00:01:03" }
  }
  
  cluster_name     = "cbr-hill-k8s-cluster-01"
  cluster_endpoint = "https://10.1.10.21:6443" 
}

# --- CONTROL PLANE VMs ---
resource "proxmox_virtual_environment_vm" "talos_cp" {
  for_each  = local.cp_nodes
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

  operating_system { type = "l26" }
  initialization { datastore_id = "local-lvm" }
}

# --- WORKER VMs (EPYC Scaled) ---
resource "proxmox_virtual_environment_vm" "talos_worker" {
  for_each  = local.worker_nodes
  name      = each.key
  node_name = "cbr-hill-hypervisor-01" 

  cpu {
    cores = 16 
    type  = "host"
  }

  memory {
    dedicated = 24576 
  }

  disk {
    datastore_id = "local-lvm" 
    file_format  = "raw"
    interface    = "virtio0"
    size         = 200
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

  operating_system { type = "l26" }
  initialization { datastore_id = "local-lvm" }
}
