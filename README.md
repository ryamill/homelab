# Homelab Infrastructure & Agentic Ops

This repository serves as the centralised, version-controlled source for my personal homelab environment. It follows a GitOps philosophy, where configuration is managed as code and deployed automatically to my local infrastructure.

## Table of Contents
* [Overview](#overview)
* [Hardware Stack](#hardware-stack)
* [Software & Orchestration](#software--orchestration)
* [Identity & Access](#identity--access)
* [Repository Structure](#repository-structure)
* [The Network Agent](#the-network-agent)

---

## Overview
The goal of this lab is to maintain a robust, secure, and highly available environment that supports virtualisation, container orchestration, and AI-driven network management. This setup specifically focuses on "Cloud-at-Home" principles: web-based interfaces, zero-trust security, and automated deployments.

## Hardware Stack
| Component | Device / Model | Specifications |
| :--- | :--- | :--- |
| **Router/Firewall** | Ubiquiti Dream Machine Pro (UDM-Pro) | Core Gateway & DHCP |
| **Switching** | USW-Pro-HD-24-PoE | Layer 3 Switching, 24-Port PoE |
| **Access Points** | 2x Ubiquiti U7 Pro Wall | WiFi 7 High-Density Coverage |
| **Storage (NAS)** | Ubiquiti UNAS Pro | Primary Network Storage |
| **Compute/Server** | Supermicro (ASRock ROMED8U-2T) | AMD EPYC 7J13 |
| **NVR** | UniFi Network Video Recorder (UNVR) | CCTV & Security Management |

## Software & Orchestration
* **Hypervisor:** Proxmox 8.4 (GPU Passthrough for AI workloads)
* **Orchestration:** Talos Linux (Kubernetes/K3s)
* **Identity:** Google Identity (OIDC) via Cloudflare Zero Trust
* **Monitoring:** Prometheus & Grafana (Containerised in K3s)
* **GitOps:** FluxCD / GitHub Actions

## Identity & Access
To eliminate the overhead of a local IdP, this lab leverages **Google Identity** as the primary directory service.
* **Remote Access:** Managed via **Cloudflare Tunnels**. No open ports or traditional VPNs required.
* **Authentication:** Multi-factor authentication (MFA) is enforced at the Google account level.
* **Fallback:** Local admin accounts exist on physical hardware for "break-glass" scenarios only.

## Repository Structure
* `./agent/`: Prompts, logic, and RAG documentation for the Ubiquiti Support Agent.
* `./kubernetes/`: Helm charts and manifests for the Talos/K3s cluster.
* `./networking/`: VLAN definitions, IP schemes, and UniFi configuration backups.
* `./terraform/`: Infrastructure-as-Code for Cloudflare Tunnels and DNS.
* `./diagrams/`: Logical and physical network topology.

## The Network Agent
The `homelab-agent` is a specialized AI assistant designed to monitor and support this specific network stack.
* **Grounding:** Uses the Ubiquiti documentation stored in `./docs/` via RAG.
* **Live Data:** Connects to the UniFi Site Manager API for real-time status and security logs.
* **Purpose:** Detects suspicious behavior, assists in troubleshooting, and provides configuration advice.
