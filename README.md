# CloudPulse – Automated Microservices Platform

> A production-inspired DevOps project built from scratch on a single AWS EC2 Free Tier instance.

CloudPulse demonstrates an end-to-end DevOps workflow using modern Infrastructure as Code (IaC), Configuration Management, Containerization, Kubernetes orchestration, CI/CD, and Monitoring.

The goal of this project is to simulate how modern organizations deploy and manage cloud-native applications while staying entirely within the AWS Free Tier.

---

## Project Overview

CloudPulse automates the complete application deployment lifecycle.

Instead of manually provisioning infrastructure, configuring servers, deploying applications, and monitoring systems, everything is automated using industry-standard DevOps tools.

This project covers:

- Infrastructure as Code (Terraform)
- Configuration Management (Ansible)
- Docker Containerization
- Kubernetes (K3s)
- GitHub Actions CI/CD
- AWS CloudWatch Monitoring
- SNS Email Alerts
- Elastic IP Management

---

## Architecture

```text
                    GitHub Repository
                           │
                           │ Push
                           ▼
                 GitHub Actions (CI/CD)
                           │
                     SSH + Rsync
                           │
                           ▼
                    AWS EC2 (Amazon Linux)
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   Terraform          Ansible            Docker
(Infrastructure)   (Configuration)   (Containerization)
        │                  │                  │
        └──────────────────┼──────────────────┘
                           ▼
                     Kubernetes (K3s)
                           │
                           ▼
                    Python Web Application
                           │
                           ▼
                    NodePort Service
                           │
                           ▼
                   Public Browser Access

               CloudWatch + SNS Monitoring
```

---

## Features

- Infrastructure provisioning using Terraform
- Server configuration using Ansible
- Dockerized Python application
- Kubernetes deployment using K3s
- Automated deployments with GitHub Actions
- CloudWatch CPU monitoring
- SNS Email notifications
- Elastic IP management
- Production-inspired DevOps workflow
- Completely built using AWS Free Tier

---

## Tech Stack

| Category | Technology |
|-----------|------------|
| Cloud | AWS EC2 |
| IaC | Terraform |
| Configuration | Ansible |
| Containerization | Docker |
| Orchestration | K3s (Kubernetes) |
| CI/CD | GitHub Actions |
| Monitoring | CloudWatch |
| Notifications | SNS |
| Version Control | Git & GitHub |
| Language | Python |
| OS | Amazon Linux 2023 |

---

## Project Structure

```text
CloudPulse/
│
├── app/
│   ├── app.py
│   └── Dockerfile
│
├── terra/
│   └── main.tf
│
├── ansible/
│   ├── hosts
│   ├── playbook.yml
│   └── k3s-playbook.yml
│
├── k8s/
│   └── deployment.yml
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── .gitignore
│
└── README.md
```

---

## Workflow

### Phase 1 – AWS EC2

- Launch Amazon Linux EC2
- Configure Security Groups
- Connect using SSH

---

### Phase 2 – Infrastructure as Code

Terraform provisions:

- Security Groups
- S3 Bucket
- Elastic IP
- CloudWatch Alarm
- SNS Topic

Commands:

```bash
terraform init
terraform plan
terraform apply
```

---

### Phase 3 – Configuration Management

Ansible automates:

- Git installation
- Docker installation
- K3s installation
- Server configuration

Run:

```bash
ansible-playbook -i hosts playbook.yml
```

---

### Phase 4 – Docker

Build the application image.

```bash
docker build -t cloud-app .
```

Run:

```bash
docker run -d -p 80:8080 cloud-app
```

---

### Phase 5 – Kubernetes (K3s)

Deploy application

```bash
kubectl apply -f deployment.yml
```

Verify

```bash
kubectl get pods

kubectl get svc
```

---

### Phase 6 – CI/CD

Every push to the **main** branch automatically:

- Connects to EC2
- Copies project files
- Runs Terraform
- Deploys latest application

No manual deployment required.

---

### Phase 7 – Monitoring

CloudWatch monitors:

- CPU Utilization

SNS sends:

- Email notifications

---

## End-to-End Deployment Flow

```text
Developer
     │
 git push
     │
     ▼
GitHub Repository
     │
     ▼
GitHub Actions
     │
 SSH + Rsync
     │
     ▼
AWS EC2
     │
Terraform
     │
Ansible
     │
Docker
     │
K3s
     │
Application
     │
CloudWatch
     │
SNS Alerts
```

---

## Installation

Clone repository

```bash
git clone https://github.com/yourusername/project2.git

cd cloudpulse
```

Install Terraform

```bash
terraform --version
```

Install Docker

```bash
docker --version
```

Install Ansible

```bash
ansible --version
```

Install K3s

```bash
curl -sfL https://get.k3s.io | sh -
```

---

## Running the Project

Provision Infrastructure

```bash
terraform apply
```

Configure Server

```bash
ansible-playbook playbook.yml
```

Build Docker Image

```bash
docker build -t cloud-app .
```

Deploy Kubernetes

```bash
kubectl apply -f deployment.yml
```

---

## Monitoring

CloudWatch Alarm

- CPU Utilization > 20%

SNS

- Sends Email Notification

---

## Security

- IAM Role Authentication
- Security Groups
- SSH Key Authentication
- Elastic IP
- Infrastructure managed using Terraform
- Secrets managed through GitHub Secrets

---

## Lessons Learned

During this project I learned:

- Infrastructure as Code using Terraform
- Configuration Management using Ansible
- Docker image creation
- Kubernetes deployments
- GitHub Actions automation
- Linux administration
- AWS networking
- Debugging Kubernetes image issues
- Monitoring with CloudWatch
- Infrastructure automation best practices

---

## Challenges Faced

Some real-world issues solved during development:

- Incorrect Ansible package names
- Docker networking
- AWS Security Group configuration
- K3s image import issues
- Git large file history cleanup
- GitHub Actions SSH authentication
- Terraform authentication
- Kubernetes image mismatch

These debugging experiences helped strengthen practical DevOps troubleshooting skills.

---

## Future Improvements

- Deploy multiple microservices
- Helm Charts
- ArgoCD GitOps
- Prometheus Monitoring
- Grafana Dashboards
- EKS Deployment
- Blue/Green Deployments
- Canary Releases
- SonarQube Integration
- Trivy Image Scanning

---

## Screenshots

Add screenshots here:

### AWS EC2 Instance

![EC2 Instance](images/ec2.png)

**Caption:** Amazon EC2 instance hosting the deployed application with public IP and IAM role configured.

### Terraform Infrastructure

![Terraform](images/terra.png)

**Caption:** Terraform validation and apply confirming infrastructure is successfully provisioned and up to date.

### Docker Deployment

![Docker Containers](images/docker.png)

**Caption:** Docker image and running container verifying successful application deployment using Docker.

### Kubernetes Deployment

![Kubernetes](images/kubectl.png)

**Caption:** Kubernetes deployment showing running pods, cluster node, and exposed NodePort service.

### GitHub Actions Workflow

![GitHub Actions Workflow](images/actions-code.png)

**Caption:** GitHub Actions workflow automates deployment by syncing code to the EC2 instance and executing Terraform remotely.

### Successful CI/CD Pipeline

![GitHub Actions Pipeline](images/actions-pipeline.png)

**Caption:** Successful GitHub Actions pipeline showing all deployment stages completed without errors.

### CloudWatch Alarm Triggered

![CloudWatch Alarm](images/cw-alaram.png)

**Caption:** Amazon CloudWatch alarm triggered when EC2 CPU utilization exceeded the configured threshold.

### CloudWatch Alarm Recovery

![CloudWatch Healthy](images/cw-healthy.png)

**Caption:** CloudWatch alarm automatically returned to the OK state after CPU utilization normalized.

### SNS Email Notification

![SNS Email](images/sns-mail.png)

**Caption:** Amazon SNS email subscription used for receiving CloudWatch alarm notifications.

### Application Deployment

![Application Running](images/app.png)

**Caption:** CloudPulse application successfully deployed and accessible through the EC2 public IP.
---

## Author

**Vishwas G M**

Aspiring DevOps Engineer

Built this project to gain hands-on experience with modern DevOps practices using AWS Free Tier and open-source technologies.

---

## If you found this project useful

Please consider giving the repository a ⭐ on GitHub.
