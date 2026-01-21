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

# Day 17 – Network Telemetry Validation (VPC Flow Logs)

## Objective
Validate that network enforcement decisions are observable using VPC Flow Logs by confirming both allowed (ACCEPT) and denied (REJECT) traffic at the ENI level. This demonstrates default-deny network behavior and telemetry visibility aligned with Zero Trust principles.

---

## Architecture Overview
- Client EC2 instance initiates network connections
- **Application EC2 instance** is protected by a Security Group
- Security Group policy:
  - Allow: TCP 443 (HTTPS) from client SG
  - Deny: All other inbound traffic (implicit default deny)
- VPC Flow Logs** enabled with traffic type set to ALL
- Logs delivered to **CloudWatch Log Group

---

## Validation Steps

### 1. ACCEPT Traffic Test (Allowed Path)
From the client instance, an HTTPS connection attempt was made to the application instance on port 443.

Expected Result
- Connection allowed
- Flow Logs record `ACCEPT` decision

Observed Result
- Flow Logs show `ACCEPT OK` entries for TCP 443 traffic

---

### 2. REJECT Traffic Test (Denied Path)
From the client instance, a connection attempt was made to a non-permitted port (SSH / TCP 22).

Method
- Connection initiated using Bash `/dev/tcp` (no package installs required)
- Environment intentionally has no outbound internet access

Expected Result
- Connection denied by Security Group
- Flow Logs record `REJECT` decision

Observed Result
- Flow Logs show `REJECT OK` entries for TCP 22 traffic at the application ENI

---

## Evidence Collected
The following evidence is included in this project:
- VPC Flow Log entries showing **ACCEPT** traffic on port 443
- VPC Flow Log entries showing **REJECT** traffic on port 22
- Application Security Group inbound rules (443 only)
- Flow Log configuration confirming traffic type = **ALL**

---

## Key Takeaways
- Network enforcement decisions are observable at the ENI level
- Default-deny behavior is enforced through Security Groups
- Both allowed and denied traffic are logged for audit and detection
- This validates telemetry required for Zero Trust network monitoring

---

## Zero Trust Alignment
- **Never Trust, Always Verify**: Only explicitly allowed traffic is permitted
- **Least Privilege**: Application exposure limited to required port only
- **Continuous Monitoring**: Enforcement decisions are logged and auditable

---

## Status
✅ Day 17 complete  
➡️ Proceeding to Day 18



