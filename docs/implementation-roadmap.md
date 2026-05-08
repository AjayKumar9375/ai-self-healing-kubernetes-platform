# Implementation Roadmap

Use this roadmap to build the project over multiple sessions.

## Session 1: Repository And Infrastructure Skeleton

- Create project folders
- Add Terraform for VPC, EKS, node groups, and ECR
- Add baseline Kubernetes namespaces
- Document setup requirements

## Session 2: Sample Application

- Build a containerized Python app
- Add health and readiness endpoints
- Deploy to Kubernetes with resource limits and probes
- Expose service internally

## Session 3: CI/CD

- Configure GitHub Actions pipeline
- Configure Jenkinsfile alternative
- Push images to ECR
- Deploy using `kubectl set image`
- Add rollback command

## Session 4: Monitoring And Alerting

- Install kube-prometheus-stack
- Configure Alertmanager Slack receiver
- Add Prometheus alert rules
- Import or build Grafana dashboards

## Session 5: Auto-Remediation

- Add Python Kubernetes client script
- Detect failed pods
- Restart deployments by patching pod template annotations
- Scale deployments under sustained pressure
- Send Slack notifications

## Session 6: Real-Time Demonstrations

- Kill pod and show auto-recovery
- Crash app and show alert
- Generate traffic and show HPA scaling
- Deploy faulty image and rollback

## Session 7: AI Enhancements

- Collect resource history from Prometheus
- Add anomaly detection thresholds
- Recommend scaling before failures
- Add incident summary generation

