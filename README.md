

# 🛡️ Zero Trust Labs — AWS Security Engineering Portfolio

This repository demonstrates practical Zero Trust architecture, enforcement, monitoring, and automated response in AWS.
Each project represents a distinct operational pillar of Zero Trust security engineering.



# 🚧 Projects



## 🔹 ZT Network — Microsegmentation (SG + Flow Logs)

Implements workload isolation using AWS Security Groups with a default-deny posture.
VPC Flow Logs validate enforcement and provide visibility into allowed and rejected traffic.

### Key Concepts

* Explicit allow / implicit deny model
* Workload boundary enforcement
* Flow Log telemetry validation

📁 Project: `zt-network-microsegmentation`



## 🔹 ZT Network — Private Access via SSM (No Inbound)

Demonstrates secure administrative access to EC2 without opening inbound ports or exposing instances to the internet.

### Key Concepts

* No SSH (port 22 closed)
* No bastion host
* No public IP requirement
* AWS Systems Manager Session Manager

📁 Project: `zt-network-private-ssm`



## 🔹 ZT Network — Detection & Assurance

Flow Logs, GuardDuty, and Automated Isolation

Moves beyond static configuration and into **continuous operational assurance**.

This project demonstrates how network enforcement is:

* Validated through telemetry
* Monitored for drift
* Analyzed for suspicious behavior
* Automatically contained when threats are detected

### Key Concepts

* Baseline ACCEPT / REJECT behavior
* Drift detection via Flow Log analysis
* GuardDuty threat findings
* EventBridge → Lambda automated response
* EC2 Security Group quarantine

📁 Project: `zt-network-detection-and-assurance`


## 🔹 ZT Data — S3 Data Perimeter (VPC Endpoint Enforcement)

Implements a Zero Trust data perimeter around Amazon S3 using network path validation and explicit deny logic.

Access to the bucket is restricted to approved VPC endpoints and HTTPS-only traffic, preventing public or cross-account access outside the defined boundary.

### Key Concepts

* S3 Gateway VPC Endpoint enforcement
* Explicit Deny bucket policy
* `aws:SourceVpce` conditional access
* TLS-only (SecureTransport) enforcement
* Break-glass administrative control
* Cross-account access validation

📁 Project: `zt-data-perimeter-s3-vpce`



# 🎯 Outcome

These projects demonstrate that Zero Trust is:

✔ Configured (segmentation)
✔ Hardened (private administrative access)
✔ Scoped (network-bound data perimeters)
✔ Monitored (telemetry + baselining)
✔ Defended (threat detection)
✔ Enforced (automated containment)

Zero Trust is not a static firewall rule or architecture diagram —
it is a continuous security lifecycle.










