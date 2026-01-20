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
From the client instance, application traffic to the app instance was **explicitly allowed** on the approved port, while other ports were denied by default.

- ✅ Allowed: HTTPs (443) from `zt-lab2-client-sg` → `zt-lab2-app-sg`
- ❌ Denied: SSH (22), HTTP (80), ICMP and non-approved ports (e.g., 3306)

This demonstrates micro-segmentation enforced by Security Groups (explicit allow / default deny), independent of network location.

## Day 14 Results (Visibility & Telemetry)
VPC Flow Logs were enabled to provide visibility into east-west traffic.

- Allowed traffic on the approved port (443) generated ACCEPT entries
- Non-approved ports (e.g., 22, 80, 3306) generated REJECT entries
- Logs correlate directly to Security Group enforcement decisions

This confirms micro-segmentation is enforced and observable.

Day 15 — Private Administrative Access with AWS SSM
Objective
Demonstrate private administrative access to EC2 instances without exposing inbound management ports (SSH/RDP), using AWS Systems Manager (SSM) and VPC interface endpoints.
What This Demonstrates
No inbound SSH or RDP rules on EC2
No public IPs on instances
Administrative access is brokered through AWS SSM
Reduced attack surface and improved auditability
Key Zero Trust Concepts
Elimination of implicit network trust
Identity-based access instead of network-based access
Strong visibility and audit logging

Day 16 — Microsegmentation with Security Groups & VPC Flow Logs
Objective
Demonstrate Zero Trust network enforcement using default-deny security groups, explicit application access, and continuous traffic verification with VPC Flow Logs.
Architecture Summary
Private VPC (10.20.0.0/16)
Separate client and application subnets
Security Groups act as Policy Enforcement Points
Only TCP 443 is explicitly allowed
All other traffic is implicitly denied
Enforcement Model
Explicit Allow: TCP 443 from client security group to application
Implicit Deny: SSH (22), HTTP (80), ICMP
Visibility: VPC Flow Logs capture ACCEPT and REJECT events


