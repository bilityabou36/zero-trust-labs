# Zero Trust Data Perimeter — Encryption and Access Control

## Objective

This project demonstrates Zero Trust enforcement at the data layer by implementing encryption, explicit deny controls, and access boundary protections in AWS.

The goal is to:

- Enforce encryption using a customer-managed KMS key (CMK)
- Prevent unintended public exposure
- Implement explicit deny guardrails
- Validate control effectiveness through misuse testing
- Establish a data perimeter aligned with Zero Trust principles

---

## Architecture Overview

(Data pillar architecture diagram will be added after implementation)

This implementation includes:

- AWS KMS Customer-Managed Key (CMK)
- Amazon S3 bucket with enforced encryption
- Block Public Access configuration
- Explicit deny bucket policies (added in Day 2)
- Validation testing of denied actions

---

## Controls Implemented (Phase 1)

- Customer-managed KMS key with rotation enabled
- S3 default encryption using CMK
- Bucket Owner Enforced object ownership
- Block Public Access enabled

---

## Validation Tests

Phase 1 validation:

- Verified object encryption using CMK
- Confirmed public access is fully blocked

Additional misuse testing and enforcement validation will be implemented in subsequent phases.

---

## Evidence

- 01-kms-cmk-created.png
- 02-s3-bucket-settings.png
- 03-object-encrypted-with-cmk.png
- 04-block-public-access-enabled.png

---

## Zero Trust Data Takeaways

- Encryption without governance is insufficient.
- Explicit deny provides stronger enforcement than allow-only models.
- Data perimeters must be intentionally designed.
- Continuous validation is required to maintain data integrity and control.
