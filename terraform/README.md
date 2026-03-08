# Terraform Configurations Files for Automation of Network Services, Home Lab and Home IoT devicess

This repository houses the Terraform configuration files used to automate the deployment and management of various services and infrastructure components within my home network. The goal is to define infrastructure as code, ensuring consistency, repeatability, and efficient management of resources.

<hr>

## Purpose
The primary purpose of this repository is to:
* **Automate Infrastructure Provisioning:** Define and deploy network devices, virtual machines, and other services using a declarative approach.
* **Ensure Consistency:** Maintain a consistent state for all deployed infrastructure, reducing configuration drift and manual errors.
* **Enable Repeatability:** Easily recreate or replicate environments for testing, disaster recovery, or scaling.
* **Version Control:** Track all infrastructure changes through Git, allowing for easy rollbacks and collaboration.

## Capabilities and Features
These Terraform configurations are designed to manage and automate various aspects of the home network, including:
* **Network Segmentation (VLANs):** Define and manage VLANs for different network zones (e.g., Management, Servers, Users, Guest, DMZ, CCTV, IoT).
* **Ubiquiti Device Configuration:** Automate the setup and configuration of Ubiquiti devices like the UDM-Pro, USW-Pro-HD-24-PoE switch, and U7-Pro-Wall Access Points.
* **Server & Homelab Provisioning:** Configure virtual machines and resources on the Proxmox homelab server.
* **Security Policies:** Implement firewall rules and network access controls for inter-VLAN communication and internet access.
* **Service Deployment:** Automate the deployment of specific services or applications within the network (e.g., NAS setup, NVR integration).

## Prerequisites
Before using these Terraform configurations, ensure you have the following installed and configured:
* **Terraform CLI:** Download and install the latest version of Terraform from the official HashiCorp website.
* **Cloud/Provider Credentials:** Ensure your Ubiquiti UniFi Controller (UDM-Pro) is accessible and you have the necessary API keys or credentials configured for any other providers you might use (e.g., Proxmox API access).
* **Git:** For cloning this repository and managing versions.

## Usage
Follow these general steps to use the Terraform configurations in this repository:
1. **Clone the Repository:**
```
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

2. **Navigate to the Desired Configuration:**
Configurations are typically organized into logical directories (e.g., by environment or service). Navigate to the specific directory you wish to deploy.
```
cd environments/production
# or
cd modules/network_vlan_setup
```

3. **Initialize Terraform:**
This command downloads the necessary providers and initializes the working directory.
```
terraform init
```

4. **Review the Plan:**
This command generates an execution plan, showing you exactly what Terraform will do (create, modify, or destroy resources) without actually making any changes. Always review this plan carefully!
```
terraform plan
```

5. **Apply the Configuration:**
If the plan looks correct, apply the changes to your infrastructure. You'll be prompted to confirm.
```
terraform apply
```

6. **Destroy Resources (Optional):**
To remove all resources defined in a configuration, use the destroy command. Use with extreme caution!
```
terraform destroy
```

## Repository Structure
The repository is organised to promote modularity and reusability:
* **./environments/:** Contains top-level configurations for different environments (e.g., production, development).
* **./modules/:** Contains reusable Terraform modules for common infrastructure patterns (e.g., network_vlan_setup, ubiquiti_ap_config, proxmox_vm).
* **./providers/:** (Optional) Custom provider definitions if needed.
* **README.md:** This file.

## Contributing
Contributions are welcome! If you have suggestions for improvements, bug fixes, or new automation ideas, please feel free to:
1. Fork the repository.
2. Create a new branch (git checkout -b feature/your-feature-name).
3. Make your changes and commit them (git commit -m 'Add new feature').
4. Push to the branch (git push origin feature/your-feature-name).
5. Open a Pull Request.
