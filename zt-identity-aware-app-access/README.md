


# Zero Trust Lab — Identity-Aware Application Access

WS ALB + Cognito + WAF

This lab demonstrates a Zero Trust access pattern for protecting a web application using identity verification before application access.

Instead of exposing workloads directly to the internet, user access is mediated through an authentication layer integrated with Amazon Cognito and enforced by an Application Load Balancer (ALB).

AWS WAF provides Layer-7 protection, while CloudWatch logging provides operational visibility and telemetry.

The architecture ensures that users must authenticate before reaching the application, implementing a key Zero Trust principle: never trust, always verify.

---

# Architecture Overview

User
↓
Route53 (Application DNS)
↓
Application Load Balancer (TLS termination)
↓
Authenticate with Amazon Cognito
↓
AWS WAF inspection
↓
Target Group
↓
EC2 Web Application

The ALB acts as the identity enforcement point, redirecting unauthenticated users to the Cognito managed login page.



# Technologies

* AWS Application Load Balancer (ALB)
* Amazon Cognito (User Pool)
* AWS WAF (Managed Rules)
* Amazon EC2 (Application Server)
* AWS Certificate Manager (ACM)
* Amazon Route53
* AWS CloudWatch Logs
* Security Groups


# Zero Trust Principles Demonstrated

Identity Before Access
Users must authenticate through Cognito before reaching the application.

Least Privilege Network Paths
The application server only accepts traffic from the ALB.

Centralized Policy Enforcement
Authentication and security controls are enforced at the load balancer layer.

Visibility and Telemetry
CloudWatch logs provide authentication and request visibility.

---

# Repository Structure

```
architecture/
    Draw.io architecture diagrams

evidence/
    Screenshots demonstrating configuration and successful access

scripts/
    Helper scripts for validation/testing

README.md
    Lab documentation
```


# Success Criteria

The lab is considered successful when:

* Unauthenticated requests are redirected to the Cognito login page
* Authenticated users can access the application through the ALB
* AWS WAF is attached to the ALB
* CloudWatch logs provide authentication and request telemetry



# Evidence

The `evidence/` folder contains screenshots validating the configuration, including:

* Cognito managed login configuration
* ALB listener authentication rule
* Route53 DNS configuration
* HTTPS redirection
* WAF association
* Successful authenticated application access



# Key Takeaway

This architecture demonstrates how identity-aware application access can be implemented in AWS to enforce Zero Trust principles without exposing backend workloads directly to the internet.


