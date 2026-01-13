# Zero Trust: Private EC2 Access with AWS SSM

This lab demonstrates how to securely access a private EC2 instance
without SSH, VPNs, or public IPs using AWS Systems Manager (SSM).

The design follows Zero Trust principles:
- Identity-based access (IAM + SSM)
- No network trust (no inbound ports)
- Private control plane (AWS PrivateLink)
- Full session logging (CloudTrail + CloudWatch)

This architecture mirrors enterprise PAM systems like CyberArk and BeyondTrust,
implemented using cloud-native AWS controls.
