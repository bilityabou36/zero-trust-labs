# ZT Network — Detection & Assurance (Flow Logs + Drift Monitoring)

## Objective
Move beyond configuring Zero Trust controls to operational assurance.
This project uses VPC Flow Logs to baseline normal behavior and detect policy drift
or suspicious traffic patterns.

---

## Key Questions
- What does “normal” ACCEPT and REJECT behavior look like?
- How would misconfiguration appear in telemetry?
- How can we continuously verify microsegmentation is still enforced?

---

## Definitions

### Normal
Expected traffic patterns that align with design:
- ACCEPT on TCP 443
- REJECT on SSH (22) and ICMP

### Drift
A change in enforcement that was not intended:
- ACCEPT on new ports
- Sudden disappearance of expected REJECT patterns
- New source/destination relationships

### Suspicious
Traffic inconsistent with baseline:
- Unexpected port scans
- REJECT spikes
- Traffic to unknown destinations

---

## Outcome
This project shows how Zero Trust is operated, not just configured,
through telemetry, baselining, and drift detection.

## Planned Evidence

| ID | File | Meaning |
|----|------|---------|
| 01 | baseline-accept-443.png | Normal allowed traffic |
| 02 | baseline-reject-22-icmp.png | Normal denied traffic |
| 03 | reject-count-by-port.png | Pattern awareness |
| 04 | eni-traffic-validation.png | Workload boundary enforcement |
| 05 | drift-detection-logic.png | Query that flags unexpected ACCEPT |
| 06 | cloudwatch-logstream.png | Continuous telemetry source |

### 🔹 ZT Network — Detection & Assurance
Operationalizes Zero Trust by baselining network telemetry and detecting policy drift.

📁 Project: [zt-network-detection-and-assurance](./zt-network-detection-and-assurance)
