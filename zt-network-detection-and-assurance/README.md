# ZT Network — Detection & Assurance  
Flow Logs, GuardDuty, and Automated Isolation

## Objective

Move beyond simply configuring Zero Trust controls and into **continuous operational assurance.

This project demonstrates how network enforcement is **validated, monitored, and automatically responded to using:

- VPC Flow Logs (telemetry)
- GuardDuty (threat detection)
- EventBridge + Lambda (automated response)
- Security Group quarantine (containment)

The focus is not just “Is Zero Trust configured?”  
The focus is “Is Zero Trust still being enforced right now?”


## Key Questions

- What does normal ACCEPT and REJECT behavior look like?
- How would misconfiguration or drift appear in telemetry?
- How do we detect when enforcement changes unexpectedly?
- How do we automatically respond when behavior becomes **suspicious**?



## Definitions

### Normal
Expected traffic aligned with microsegmentation design:

- ACCEPT on TCP 443 (approved application traffic)
- REJECT on SSH (22) and ICMP
- Consistent source/destination relationships



### Drift
Unintended change in enforcement posture:

- ACCEPT on new or unexpected ports
- Sudden disappearance of expected REJECT patterns
- New communication paths between workloads

Drift indicates policy misconfiguration, rule changes, or control failure.

---

### Suspicious
Traffic that deviates from baseline patterns:

- Port scanning attempts
- REJECT spikes
- Connections to unknown or unapproved destinations

Suspicious activity triggers automated containment.


## Operational Flow

1. Baseline Network Behavior  
   Flow Logs establish normal ACCEPT and REJECT patterns.

2. Continuous Monitoring  
   Queries identify drift and abnormal traffic patterns.

3. Threat Detection 
   GuardDuty generates findings based on anomalous activity.

4. Automated Response  
   EventBridge triggers a Lambda function that:
   - Swaps the EC2 instance Security Group
   - Isolates the workload
   - Logs the action to CloudWatch

5. Proof of Enforcement  
   Post-isolation telemetry confirms network access is blocked.


## Evidence Structure

This project is organized to mirror a real incident lifecycle:

| Folder | Purpose |
|--------|--------|
| 01-network-detection | Baseline ACCEPT/REJECT behavior |
| 02-guardduty-detection | Threat detection evidence |
| 03-response-automation | Lambda + IAM automation proof |
| 04-isolation-proof | Post-response containment validation |


## Outcome

This project demonstrates how Zero Trust is:

✔ Monitored through telemetry  
✔ Verified through baselining  
✔ Defended through detection  
✔ Enforced through automated containment  

Zero Trust is not a static configuration — it is a continuous assurance process.


