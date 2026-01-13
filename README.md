# Zero Trust Architecture Labs

This repository documents hands-on Zero Trust security architecture labs implemented using AWS-native services.

The goal of this project is to demonstrate:
- Identity-first access
- No implicit network trust
- Private resource access
- Full visibility and auditability

## Lab Structure

- `network/` → Network pillar labs
  - `network/private-ssm-access/` → Private EC2 access using SSM (no SSH)

## Featured Lab

### Private EC2 Access Without SSH
- No inbound ports
- No bastion host
- No VPN
- Identity-based access using AWS SSM
- Full session logging via CloudTrail and CloudWatch

This mirrors enterprise Zero Trust and PAM architectures used in regulated environments.

## Repo Artifacts You’ll See
- Architecture diagrams (`/diagrams`)
- Evidence screenshots (`/evidence`)
- Step-by-step lab notes (`/notes`)




