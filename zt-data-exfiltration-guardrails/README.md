

# 🔐 ZT Data — Exfiltration Guardrails (S3 VPC Endpoint Enforcement)

## Overview

This project implements a Zero Trust data egress boundary by restricting Amazon S3 access to an approved private network path using a Gateway VPC Endpoint.

Access is allowed only when:

* Requests originate from the approved VPC endpoint
* Transport is encrypted (HTTPS)

All other access paths are explicitly denied.



## Architecture

Architecture diagram:
[https://github.com/bilityabou36/zero-trust-labs/blob/main/zt-data-exfiltration-guardrails/architecture/zt-s3-vpce-data-perimeter-architecture.png](https://github.com/bilityabou36/zero-trust-labs/blob/main/zt-data-exfiltration-guardrails/architecture/zt-s3-vpce-data-perimeter-architecture.png)

Access model:

* EC2 inside VPC → S3 via VPCE → ✅ Allowed
* Public / non-VPCE path → ❌ Denied
* Cross-account access (without VPCE) → ❌ Denied

---

## Controls Implemented

* `aws:SourceVpce` conditional enforcement
* TLS-only (`aws:SecureTransport`) enforcement
* Explicit Deny bucket policy model
* Break-glass administrative exception

---

## Validation

| Scenario              | Result |
| --------------------- | ------ |
| Approved VPC access   | ✅      |
| Public path attempt   | ❌      |
| Cross-account attempt | ❌      |
| Non-HTTPS request     | ❌      |

Evidence available in `/evidence/`.

---

## Key Principle

Data exfiltration is prevented by validating where the request originates, not just who is making it.

Zero Trust enforcement must include network path verification.


