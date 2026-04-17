# IT Operations Portfolio

## About this project

This portfolio demonstrates hands-on knowledge of IT help desk operations, ticketing systems, asset management, and troubleshooting methodology. Each project simulates real-world IT support workflows using free, open-source tools running in a local lab environment.

The goal is to show that I understand how IT support teams operate in practice: how tickets flow from creation to resolution, how assets are tracked across their lifecycle, and how documentation keeps a help desk running efficiently.

## What this covers

| Area | What I did |
|------|-----------|
| **IT Ticketing (osTicket)** | Installed and configured an open-source ticketing system with departments, SLA rules, and realistic sample tickets walked through the full lifecycle |
| **Asset Tracking (Snipe-IT)** | Set up IT asset management with mock inventory, user assignments, check-in/check-out workflows, and warranty tracking |
| **Troubleshooting Runbooks** | Wrote step-by-step SOPs for common IT issues (Wi-Fi, printers, Outlook, new employee setup, slow computer diagnosis) with decision trees |
| **Active Directory Lab** | Built a Windows Server environment with AD DS, user/group management, Group Policy, DNS, and DHCP |
| **Combined Workflow** | Connected a support ticket to an asset lookup, demonstrating the end-to-end process from user request to resolution |

## Tools used

- osTicket (open-source ticketing system)
- Snipe-IT (open-source asset management)
- VirtualBox
- Windows Server 2022 (evaluation)
- Active Directory Domain Services
- draw.io (process flowcharts)

## Project structure

```
it-operations-portfolio/
├── 01-ticketing-system/
│   ├── osticket-setup.md
│   ├── department-sla-config.md
│   ├── sample-tickets/
│   │   ├── password-reset.md
│   │   ├── software-install-request.md
│   │   ├── hardware-failure.md
│   │   ├── access-request.md
│   │   ├── vpn-connectivity.md
│   │   ├── printer-issue.md
│   │   ├── new-employee-onboarding.md
│   │   └── email-not-syncing.md
│   └── screenshots/
├── 02-asset-tracking/
│   ├── snipeit-setup.md
│   ├── inventory-categories.md
│   ├── check-in-check-out-workflow.md
│   └── screenshots/
├── 03-troubleshooting-runbooks/
│   ├── wifi-connectivity.md
│   ├── printer-not-responding.md
│   ├── outlook-sync-failure.md
│   ├── new-employee-workstation-setup.md
│   ├── slow-computer-diagnosis.md
│   └── flowcharts/
├── 04-active-directory-lab/
│   ├── environment-setup.md
│   ├── ad-users-groups.md
│   ├── group-policy-config.md
│   ├── dns-dhcp-setup.md
│   └── screenshots/
├── 05-combined-workflow/
│   ├── ticket-to-resolution-walkthrough.md
│   └── screenshots/
└── README.md
```

## Key decisions and rationale

- Why I structured ticket categories and priorities the way I did, and how SLA timers mirror real IT environments
- Why asset categorization separates hardware by type rather than by department
- Why each troubleshooting runbook uses a decision tree format instead of a linear checklist
- Why the Active Directory OU structure mirrors a small business rather than a flat hierarchy

## Status

- [x] Repository structure created
- [ ] osTicket installation and configuration
- [ ] Sample tickets created and documented
- [ ] Snipe-IT setup and mock inventory
- [ ] Troubleshooting runbooks written
- [ ] Active Directory lab built and documented
- [ ] Combined ticket-to-asset workflow documented
- [ ] All screenshots and documentation finalized

## About me

Celest Moreira | B.S. Management Information Systems, Long Beach State (May 2026)
[LinkedIn](https://linkedin.com/in/celest-moreira)
