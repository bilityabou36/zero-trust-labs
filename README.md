# Private EC2 Access Without SSH (Zero Trust)

This lab demonstrates identity-based privileged access to EC2 with **no network trust** using AWS Systems Manager (SSM), CloudTrail, and VPC Endpoints.

The instance has:
- No inbound ports
- No SSH
- No bastion host
- No VPN
- No public internet

All access is:
- IAM authenticated
- Encrypted
- Fully audited

---

## Architecture

![Architecture](images/architecture.png)


## 1️⃣ Zero Trust Entry Path

Instead of SSH:
- Users authenticate to AWS IAM
- IAM authorizes SSM
- SSM opens a secure tunnel to the instance

![SSM Session](images/ssm-session.png)


## 2️⃣ Session Audit (CloudTrail)

Every shell session generates CloudTrail events.

This shows who started a session and **when**:

![CloudTrail StartSession](images/cloudtrail-startsession.png)

Full SSM activity is also logged:

![CloudTrail Events](images/cloudtrail-events.png)

---

## 3️⃣ No Internet Access

The instance cannot reach the public internet:

![No Internet](images/no-internet-curl.png)

This proves:
> Network access is denied even while management access works.

---

## 4️⃣ Private AWS Control Plane Access

SSM still works because the instance uses **VPC Interface Endpoints**:

![VPC Endpoints](images/vpc-endpoints.png)

These allow:
- SSM
- SSM Messages
- EC2 Messages

…without public internet.

---

## 5️⃣ Zero Trust Security Posture

The instance security group has **no inbound rules**:

![No Inbound](images/ec2-no-inbound.png)

This means:
- No SSH
- No RDP
- No application ports
- Only identity-based control

---

## What This Proves

This lab implements:

| Traditional | Zero Trust |
|-----------|-----------|
| SSH Keys | IAM Identity |
| Bastion Hosts | SSM |
| Network trust | Device + Identity trust |
| No session logs | Full CloudTrail audit |
| Internet dependency | Private VPC endpoints |

This is how modern PAM and Zero Trust access is implemented in regulated enterprises.





