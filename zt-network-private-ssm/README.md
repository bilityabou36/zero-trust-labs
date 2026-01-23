# Zero Trust: Private EC2 Access with AWS SSM

This lab demonstrates how to securely access a private EC2 instance **without SSH, VPNs, bastion hosts, or public IPs** using AWS Systems Manager (SSM).

The design replaces network-based trust with **identity-based privileged access** and full session auditing.

## Zero Trust Principles Applied

- Identity-based access:** IAM + SSM authorization
- No network trust:** No inbound security group rules
- Private control plane:** AWS PrivateLink (VPC Interface Endpoints)
- Continuous monitoring:** CloudTrail and CloudWatch session logging

This architecture mirrors enterprise PAM solutions such as CyberArk and BeyondTrust, implemented using cloud-native AWS controls.

---

## Architecture

### 1️⃣ Zero Trust Entry Path
Instead of SSH access:

- Users authenticate to AWS IAM
- IAM authorizes SSM session access
- SSM establishes a secure, outbound-only tunnel to the instance

No inbound ports are ever opened.

---

### 2️⃣ Session Auditing (CloudTrail)
Every interactive shell session generates CloudTrail events, including:
- Who initiated the session
- When access occurred
- Which instance was accessed

This provides full privileged session accountability.

---

### 3️⃣ No Internet Access
The EC2 instance has **no route to the public internet**.

Management access still works because:
- SSM traffic flows through private VPC endpoints
- No NAT gateway or internet gateway is required

This proves that **administrative access does not require internet connectivity**.

---

### 4️⃣ Private AWS Control Plane Access
The instance communicates with AWS services via VPC Interface Endpoints for:
- SSM
- SSM Messages
- EC2 Messages

All control-plane traffic remains inside the AWS network.

---

### 5️⃣ Security Posture Summary

- No inbound security group rules
- No SSH or RDP
- No bastion host
- No VPN
- No public IPs

Only identity-authorized, audited access is allowed.

---

## What This Lab Proves

| Traditional Model | Zero Trust Model |
|------------------|-----------------|
| SSH keys | IAM identities |
| Bastion hosts | SSM sessions |
| Network trust | Identity + device trust |
| No session visibility | Full CloudTrail audit |
| Internet dependency | Private VPC endpoints |

This is how modern Zero Trust and PAM access is implemented in regulated enterprise environments.

