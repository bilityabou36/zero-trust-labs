# Zero Trust Data Perimeter — Encryption & Explicit Deny

## Overview

This project demonstrates enforcement of a Zero Trust data boundary in AWS by combining encryption, explicit deny guardrails, and centralized audit logging.

Trust is never assumed. Every request is verified.

---

## Controls Implemented

- IAM authenticated access required  
- S3 Block Public Access enabled  
- Explicit Deny policy:
  - Deny non-HTTPS requests  
  - Deny non-SSE-KMS uploads  
- AWS KMS Customer Managed Key (CMK) with rotation enabled  
- CloudTrail audit logging enabled  

---

## Validation Testing

Misuse scenarios were executed to confirm enforcement:

- Unencrypted upload → AccessDenied  
- HTTP request → 403 Forbidden  
- Incorrect encryption header → Denied  
- Proper SSE-KMS + HTTPS → Allowed  

Evidence screenshots available in the `evidence/` folder.  
Architecture diagram available in the `architecture/` folder.

---

## Zero Trust Principles Enforced

- Explicit Deny > Implicit Allow  
- Least Privilege  
- Cryptographic Data Protection  
- Continuous Audit & Verification  

This implementation aligns with NIST 800-207 Zero Trust Architecture guidance.

