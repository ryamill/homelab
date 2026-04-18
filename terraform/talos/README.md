# Terraform Configurations Files for Automation of Talos Deployment on Proxmox

This repository houses the Terraform configuration files used to automate the deployment and management of talos on the Proxmox hypervisor.

<hr>

## Purpose
The primary purpose of this repository is to:
* **Automate Infrastructure Provisioning:** Define and deploy Talos using a declarative approach.
* **Ensure Consistency:** Maintain a consistent state for all deployed Talos control plane and worker nodes.
* **Enable Repeatability:** Easily recreate or replicate environments for testing, disaster recovery, or scaling.
* **Version Control:** Track all infrastructure changes through Git, allowing for easy rollbacks and collaboration.

## Prerequisites
Before using these Terraform configurations, ensure you have the following two configurations on your Proxmox server:
* **Proxmox API Token:** Generate an API token in the Proxmox Datacenter -> Permissions area.
* **Talos ISO:** Download the standard talos-amd64.iso and upload it to your Proxmox ISO storage (usually local:iso).
