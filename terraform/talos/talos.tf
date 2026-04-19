resource "talos_machine_secrets" "this" {}

# --- CONTROL PLANE CONFIGURATION ---
data "talos_machine_configuration" "controlplane" {
  cluster_name     = local.cluster_name
  cluster_endpoint = local.cluster_endpoint
  machine_type     = "controlplane"
  machine_secrets  = talos_machine_secrets.this.machine_secrets

  # Disable default CNI (Flannel) and kube-proxy to prepare for Cilium
  config_patches = [
    yamlencode({
      cluster = {
        network = {
          cni = { name = "none" }
        }
        proxy = { disabled = true }
      }
    })
  ]
}

resource "talos_machine_configuration_apply" "controlplane" {
  for_each                    = local.cp_nodes
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.controlplane.machine_configuration
  node                        = each.value.ip
  
  depends_on = [proxmox_virtual_environment_vm.talos_cp]
}

# --- WORKER CONFIGURATION ---
data "talos_machine_configuration" "worker" {
  cluster_name     = local.cluster_name
  cluster_endpoint = local.cluster_endpoint
  machine_type     = "worker"
  machine_secrets  = talos_machine_secrets.this.machine_secrets

  # Disable default CNI (Flannel) and kube-proxy to prepare for Cilium
  config_patches = [
    yamlencode({
      cluster = {
        network = {
          cni = { name = "none" }
        }
        proxy = { disabled = true }
      }
    })
  ]
}

resource "talos_machine_configuration_apply" "worker" {
  for_each                    = local.worker_nodes
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.worker.machine_configuration
  node                        = each.value.ip
  
  depends_on = [proxmox_virtual_environment_vm.talos_worker]
}

# --- CLUSTER BOOTSTRAP ---
resource "talos_machine_bootstrap" "this" {
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = local.cp_nodes["cbr-hill-k8s-cp-01"].ip
  
  depends_on = [
    talos_machine_configuration_apply.controlplane,
    talos_machine_configuration_apply.worker
  ]
}

resource "talos_cluster_kubeconfig" "this" {
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = local.cp_nodes["cbr-hill-k8s-cp-01"].ip
  
  depends_on = [talos_machine_bootstrap.this]
}

output "kubeconfig" {
  value     = talos_cluster_kubeconfig.this.kubeconfig_raw
  sensitive = true
}

output "talosconfig" {
  value     = talos_machine_secrets.this.client_configuration
  sensitive = true
}
