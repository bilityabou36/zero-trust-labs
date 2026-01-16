# Zero Trust Network Lab: Micro-segmentation + Flow Logs (AWS)

This lab demonstrates how to control and validate east-west traffic between two private servers (AWS EC2) using Security Groups and VPC Flow Logs.

## Goals
- Deploy two private EC2 instances in the same VPC
- Allow only explicit, approved traffic between them
- Deny everything else by default
- Prove allow/deny using reachability tests and VPC Flow Logs

## Zero Trust Principles Applied
- Explicit verification (only approved paths)
- Least privilege (only required ports)
- Continuous monitoring (Flow Logs visibility)

## Evidence
(Will be added on Days 15–18)


Day 12 complete: Deployed two private instances and validated identity-based access via SSM with no public IPs.
