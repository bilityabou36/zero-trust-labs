# Zero Trust Network Lab: Micro-segmentation + Flow Logs (AWS)

This lab demonstrates how to control and validate east-west traffic between two private servers (AWS EC2) using Security Groups and VPC Flow Logs.

## Goals
- Deploy two private EC2 instances in the same VPC
- Allow only explicit, approved traffic between them
- Deny everything else by default
- Prove allow/deny using reachability tests and VPC Flow Logs

## Zero Trust Principles Applied
- Explicit verification (only approved paths)
- Least privilege (only required ports)
- Continuous monitoring (Flow Logs visibility)

## Evidence
(Will be added on Days 15–18)


Day 12 complete: Deployed two private instances and validated identity-based access via SSM with no public IPs.
## Day 13 Results (East-West Validation)
From the client instance, application traffic to the app instance was **explicitly allowed** on the approved port, while other ports were **denied by default**.

- ✅ Allowed: HTTP (80) from `zt-lab2-client-sg` → `zt-lab2-app-sg`
- ❌ Denied: SSH (22), HTTPS (443), and non-approved ports (e.g., 3306)

This demonstrates micro-segmentation enforced by Security Groups (explicit allow / default deny), independent of network location.

