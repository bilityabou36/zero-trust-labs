# Zero Trust Lab — Identity-Aware Application Access (ALB + Cognito + WAF)

This lab demonstrates Zero Trust access to an internal web application using identity verification before application access.

Instead of exposing workloads directly to the internet, access is mediated through an authentication layer integrated with AWS Cognito and enforced through an Application Load Balancer (ALB), with AWS WAF providing L7 protections and CloudWatch providing telemetry.

## Technologies
- AWS Application Load Balancer (ALB)
- AWS Cognito (User Pool)
- AWS WAF (Managed rules)
- Amazon EC2 (private app server)
- Security Groups
- CloudWatch Logs

## Zero Trust Principles Demonstrated
- Identity before access (authenticate first)
- Least privilege network paths (ALB -> EC2 only)
- Centralized policy enforcement (ALB auth, WAF)
- Visibility and telemetry (CloudWatch logs)

## Repo Structure
- architecture/ (draw.io diagrams)
- evidence/ (screenshots)
- scripts/ (deployment helpers)

## Success Criteria
- Unauthenticated access is blocked/redirected to Cognito
- Authenticated users can access the app through ALB
- WAF is attached and logging is enabled
- CloudWatch logs show authentication and request telemetry
