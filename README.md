# AI-Powered Self-Healing Kubernetes Platform

An automated AWS EKS platform that deploys containerized services, monitors health with Prometheus and Grafana, remediates unhealthy workloads with Python automation, and sends Slack alerts for operational incidents.

## What This Project Builds

- AWS EKS cluster with managed node groups
- ECR repository for application images
- Sample microservice deployed to Kubernetes
- GitHub Actions and Jenkins CI/CD examples
- Prometheus, Grafana, and Alertmanager monitoring stack
- Python auto-healing workflow for pod failures and high resource usage
- Slack notifications for alerts and remediation events
- Demo scenarios for pod recovery, scaling, alerting, and rollback

## Architecture

```text
Developer
  -> GitHub
  -> CI/CD Pipeline
  -> Docker Build
  -> AWS ECR
  -> EKS Deployment
  -> Prometheus Monitoring
  -> Auto-Healing Script
  -> Kubernetes Remediation
  -> Slack Alerts
```

## Folder Structure

```text
.
|-- .github/workflows/
|-- docker/
|-- jenkins/
|-- kubernetes/
|-- monitoring/
|-- scripts/
|-- terraform/
|-- docs/
`-- README.md
```

## Multi-Phase Delivery Plan

### Phase 1: Foundation

- Create AWS networking and EKS cluster with Terraform
- Create ECR repository
- Configure `kubectl` access
- Deploy Kubernetes namespaces

### Phase 2: Application Deployment

- Build the sample Docker application
- Push image to ECR
- Deploy app, service, probes, and HPA
- Validate manual pod recovery

### Phase 3: CI/CD

- Add GitHub Actions pipeline
- Add Jenkins pipeline alternative
- Support image build, push, deploy, and rollback

### Phase 4: Monitoring

- Install Prometheus stack with Helm
- Configure Grafana dashboards
- Add Alertmanager Slack routing
- Monitor CPU, memory, pod health, node status, and response health

### Phase 5: Self-Healing

- Run Python auto-healing script inside the cluster
- Detect unhealthy pods and restart owning deployments
- Scale deployments during sustained high usage
- Send Slack remediation notifications

### Phase 6: Advanced AI Features

- Add anomaly scoring for CPU and memory behavior
- Add predictive scaling recommendations
- Integrate ticket creation or ChatOps commands
- Extend to multi-cluster monitoring

## Quick Start

1. Configure AWS credentials:

```powershell
aws configure
```

2. Create infrastructure:

```powershell
cd terraform
terraform init
terraform apply
```

3. Update kubeconfig:

```powershell
aws eks update-kubeconfig --region us-east-1 --name self-healing-eks
```

4. Deploy namespaces and app:

```powershell
kubectl apply -f kubernetes/namespaces.yaml
kubectl apply -f kubernetes/app/
```

5. Install monitoring:

```powershell
kubectl create secret generic slack-webhook `
  --namespace monitoring `
  --from-literal=url="https://hooks.slack.com/services/replace/me"

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack `
  --namespace monitoring --create-namespace `
  -f monitoring/kube-prometheus-stack-values.yaml
```

6. Deploy auto-healer:

```powershell
kubectl apply -f kubernetes/auto-healer/secret.example.yaml
kubectl apply -f kubernetes/auto-healer/
```

## Demo Scenarios

See [docs/demo-scenarios.md](docs/demo-scenarios.md).

## Security Notes

- Store Slack webhook URLs in Kubernetes secrets, not source control.
- Use least-privilege IAM roles for CI/CD and EKS workloads.
- Restrict public access to Grafana and Prometheus.
- Use private EKS nodes for production environments.
