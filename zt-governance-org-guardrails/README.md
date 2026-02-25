# ZT Governance — Organization Guardrails & Continuous Compliance

## 🎯 Objective

Implement Zero Trust at the AWS Organization level by enforcing security guardrails that cannot be bypassed — even by administrators.

This project introduces:

- Service Control Policies (SCP)
- IAM Access Analyzer
- CloudTrail Lake
- AWS Config Aggregator (optional)

The goal is to prevent control disablement and continuously detect governance drift across accounts.

---

## 🏗 Controls Implemented

- Organization-level explicit deny using SCP
- Detection of public or external access using IAM Access Analyzer
- CloudTrail Lake query-based governance monitoring
- Multi-account compliance visibility using AWS Config Aggregator

---

## 🧪 Misuse Scenarios Tested

- Attempt to disable GuardDuty
- Attempt to delete CloudTrail
- Attempt to create public S3 bucket
- Attempt to modify logging configuration
- External trust relationship creation

---

## 📂 Project Structure

| Folder | Purpose |
|--------|---------|
| scp | Service Control Policy definitions |
| access-analyzer | External access detection |
| cloudtrail-lake | Governance event queries |
| config-aggregator | Cross-account compliance visibility |
| architecture | Final architecture diagram |
| evidence | Implementation screenshots |

---

## 🧠 Key Principle

Zero Trust must extend beyond workloads and data —  
it must enforce governance boundaries at the organization level.

Security controls must not be optional or bypassable.
