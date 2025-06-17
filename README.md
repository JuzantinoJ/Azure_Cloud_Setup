# 🚀 Azure VM Deployment with Terraform, Docker, and Ansible

This project demonstrates how to **automate the provisioning and configuration of an Azure Virtual Machine** using **Terraform**, and then use **Ansible** to install and configure **Docker**, which in turn runs a containerized application (e.g., Nginx or a simple Flask app).

---

## 📘 Overview

### 🔧 Tools Used:

- **Terraform**: Infrastructure as Code (IaC) to provision Azure resources
- **Azure**: Cloud provider for VM and networking
- **Ansible**: Configuration management to install and manage software
- **Docker**: Container platform to run web applications

---

## 🧱 Architecture

```text
Terraform ───────────▶ Azure Cloud ─────────────▶ VM (Ubuntu)
      │                                       ┌─────┴──────┐
      └────────── Provisioned with SSH        │            │
                                       Ansible Playbook    │
                                                │          │
                                                ▼          ▼
                                          Docker Engine  App Container
```
