
# 🛡️ Zero Trust Labs — AWS Security Engineering Portfolio

This repository demonstrates practical Zero Trust architecture, enforcement, monitoring, and automated response** in AWS.  
Each project represents a different operational pillar of Zero Trust.



## 🚧 Projects

### 🔹 ZT Network — Microsegmentation (SG + Flow Logs)  
Implements workload isolation using AWS Security Groups with a default-deny posture.  
VPC Flow Logs are used to validate enforcement and detect unexpected traffic.

Key Concepts
- Explicit allow / implicit deny model  
- Workload boundary enforcement  
- Flow Log telemetry for validation  

📁 Project: `zt-network-microsegmentation`


### 🔹 ZT Network — Private Access via SSM (No Inbound)  
Demonstrates secure administrative access to EC2 without opening inbound ports or exposing instances to the internet.

Key Concepts
- No SSH (port 22 closed)
- No bastion host
- No public IP requirement
- Session Manager for secure access

📁 Project: `zt-network-private-ssm`

---

### 🔹 ZT Network — Detection & Assurance (Flow Logs + Drift Monitoring)  
Operationalizes Zero Trust by continuously verifying that network controls remain enforced.  
Uses telemetry baselining, GuardDuty detection, and automated isolation to respond to suspicious activity.

Key Concepts
- Baseline ACCEPT / REJECT behavior
- Drift detection via Flow Log analysis
- GuardDuty threat findings
- EventBridge → Lambda automated response
- EC2 Security Group quarantine

📁 Project: `zt-network-detection-and-assurance`


## 🎯 Outcome

These projects demonstrate that Zero Trust is:

✔ Configured (segmentation)  
✔ Hardened (no public admin access)  
✔ Monitored (telemetry + baselining)  
✔ Defended (threat detection)  
✔ Enforced (automated containment)

Zero Trust is not a diagram — it is an operational security lifecycle.








