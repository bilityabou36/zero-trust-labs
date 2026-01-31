## Zero Trust Network Enforcement Baseline

The following defines the approved network posture for protected EC2 workloads:

1. Only TCP 443 allowed between application tiers
2. No inbound SSH (22) from the internet
3. No inbound HTTP (80)
4. Security groups must not allow 0.0.0.0/0 unless explicitly justified
5. Any deviation is considered network policy drift

This baseline is continuously validated using AWS Config rules.
