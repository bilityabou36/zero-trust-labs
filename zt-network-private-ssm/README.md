# ZT Network — Private Access via SSM (No Inbound)

## Objective
Demonstrate Zero Trust administrative access to EC2 instances using AWS Systems Manager (SSM),
eliminating inbound SSH and public internet exposure while maintaining full auditability.

This lab validates that **management access is identity-based, private, and continuously logged**.

---

## Architecture
![SSM Private Access Architecture](architecture/ssm-private-access.png)

---

## Zero Trust Principles Applied
- **No implicit trust**: No inbound SSH (port 22) allowed
- **Least privilege access**: IAM + SSM Session Manager only
- No network exposure: No internet gateway or public IPs
- Continuous verification: All access logged via CloudTrail

---

## Implementation Summary
- EC2 instance deployed in a private subnet
- No inbound security group rules
- VPC Interface Endpoints used for:
  - `ssm`
  - `ssmmessages`
  - `ec2messages`
- Administrative access established via SSM Session Manager
- All session activity recorded in AWS CloudTrail

---

## Evidence
| Step | Evidence | Description |
|-----|--------|-------------|
| 01 | `01-vpc-endpoints.pdf` | VPC Interface Endpoints for SSM services |
| 02 | `02-no-ec2-inbound-rule.pdf` | No inbound rules on EC2 security group |
| 03 | `03-start-session.pdf` | SSM session initiated via AWS console |
| 04 | `04-ssm-session-established.pdf` | Active shell access without SSH |
| 05 | `05-cloudtrail-ssm-events.pdf` | CloudTrail logs for SSM activity |
| 06 | `06-no-internet-proof.pdf` | No internet gateway or public access |

---

## Outcome
This lab demonstrates a Zero Trust–aligned access pattern where:

- Administrative access is identity-driven, not network-driven
- EC2 instances remain fully private
- No inbound ports are exposed
- All access is auditable and revocable

This pattern aligns with NIST SP 800-207 guidance for secure, identity-based access to workloads.

---

## Notes
This approach is suitable for:
- Regulated environments
- Defense and federal workloads
- Zero Trust reference architectures
- Cloud security baselines replacing bastion hosts


