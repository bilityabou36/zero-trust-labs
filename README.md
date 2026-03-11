# 🛡️ Zero Trust Labs — AWS Security Engineering Portfolio

This repository demonstrates practical Zero Trust architecture, enforcement, monitoring, and automated response in AWS.  
Each project represents a core operational pillar of Zero Trust security engineering.


# 🧭 Zero Trust Security Pillars

| Pillar | Focus | Projects |
|------|------|------|
| Network | Workload segmentation and private access | Microsegmentation, Private SSM Access |
| Data | Data perimeter enforcement | S3 VPC Endpoint Data Perimeter |
| Governance | Organization-wide security guardrails | SCP + CloudTrail Governance |
| Detection | Continuous telemetry monitoring | GuardDuty + Flow Logs |
| Automation | Automated containment | EventBridge → Lambda isolation |



# 🚧 Projects

---

## 🔹 ZT Network — Microsegmentation (SG + Flow Logs)

Implements workload isolation using AWS Security Groups with a default-deny posture.  
VPC Flow Logs validate enforcement and provide visibility into allowed and rejected traffic.

### Key Concepts

- Explicit allow / implicit deny model  
- Workload boundary enforcement  
- Flow Log telemetry validation  

📁 Project: `zt-network-microsegmentation`

---

## 🔹 ZT Network — Private Access via SSM (No Inbound)

Demonstrates secure administrative access to EC2 without opening inbound ports or exposing instances to the internet.

### Key Concepts

- No SSH (port 22 closed)  
- No bastion host  
- No public IP requirement  
- AWS Systems Manager Session Manager  

📁 Project: `zt-network-private-ssm`



## 🔹 ZT Network — Detection & Assurance

Flow Logs, GuardDuty, and Automated Isolation

Moves beyond static configuration and into continuous operational assurance.

Network enforcement is:

- Validated through telemetry  
- Monitored for drift  
- Analyzed for suspicious behavior  
- Automatically contained when threats are detected  

### Key Concepts

- Baseline ACCEPT / REJECT behavior  
- Drift detection via Flow Log analysis  
- GuardDuty threat findings  
- EventBridge → Lambda automated response  
- EC2 Security Group quarantine  

📁 Project: `zt-network-detection-and-assurance`



## 🔹 ZT Data — S3 Data Perimeter (VPC Endpoint Enforcement)

Implements a Zero Trust data perimeter around Amazon S3 using network path validation and explicit deny logic.

Access to the bucket is restricted to approved VPC endpoints and HTTPS-only traffic, preventing public or cross-account access outside the defined boundary.

### Key Concepts

- S3 Gateway VPC Endpoint enforcement  
- Explicit Deny bucket policy  
- `aws:SourceVpce` conditional access  
- TLS-only (`SecureTransport`) enforcement  
- Break-glass administrative control  
- Cross-account access validation  

📁 Project: `zt-data-perimeter-s3-vpce`

---

## 🔹 ZT Governance — Organization Guardrails & Continuous Compliance

Implements Zero Trust governance at the AWS Organization level, ensuring security controls cannot be disabled or bypassed across accounts.

### Key Concepts

- Service Control Policy (SCP) guardrails  
- Organization-wide CloudTrail logging  
- CloudTrail Lake governance queries  
- IAM Access Analyzer external access detection  
- Cross-account compliance visibility with AWS Config Aggregator  

📁 Project: `zt-governance-org-guardrails`



# 🎯 Outcome

These projects demonstrate that Zero Trust is:

✔ Configured — segmentation and workload boundaries  
✔ Hardened — private administrative access  
✔ Scoped — network-bound data perimeters  
✔ Governed — organization security guardrails  
✔ Monitored — telemetry and baseline validation  
✔ Defended — threat detection and analysis  
✔ Enforced — automated containment and response  

Zero Trust is not a static firewall rule or architecture diagram —  
it is a continuous security lifecycle.

🔹 ZT Identity-Aware Access — Application Protection

Implements Zero Trust application access by requiring user authentication before reaching backend workloads. Access to the application is mediated through an Application Load Balancer integrated with Amazon Cognito, with AWS WAF providing Layer-7 protection and CloudWatch delivering visibility and telemetry.

Key Concepts

Identity-aware access with ALB + Cognito authentication

TLS termination and HTTPS enforcement with ACM

Layer-7 threat protection using AWS WAF

DNS routing with Amazon Route53

Application isolation using ALB → EC2 network boundaries

Request and security telemetry with CloudWatch Logs

📁 Project: zt-identity-aware-app-access

🎯 Outcome

This project demonstrates how Zero Trust principles can be applied to application access by enforcing identity verification before workload access, protecting backend services behind a controlled authentication and inspection layer.









