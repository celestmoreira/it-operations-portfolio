# IT Operations Portfolio

## About this project

This portfolio demonstrates hands-on knowledge of IT help desk operations,
asset inventory management, and network troubleshooting. Each project
simulates real-world IT support workflows using open-source tools and
real packet capture, run in a local lab environment.

The goal is to show that I understand how IT support teams operate in
practice: how tickets flow from creation to resolution, how hardware and
software assets are tracked, and how core network protocols actually work
on the wire.

## What this covers

| Area | What I did |
|------|------------|
| IT Ticketing & Asset Inventory | Deployed an open-source ticketing system (osTicket) with configured departments, SLA rules, and realistic tickets walked through the full lifecycle. Built a SQL-based asset inventory tracking hardware, users, locations, and warranty status with queries supporting IT operations reporting and onboarding workflows. |
| Network Traffic Analysis | Captured and analyzed live network traffic with Wireshark, identifying DNS, DHCP, HTTP, and TLS protocols with annotated screenshots and a network topology diagram documenting segmentation and traffic flow. |
| Troubleshooting Runbooks | Wrote step-by-step SOPs for common tier-one issues (Wi-Fi connectivity, password resets, new employee setup), including what's confirmed from hands-on experience vs. what's still on my list to learn. |

## Tools used
- osTicket (open-source ticketing system)
- MySQL / phpMyAdmin (asset inventory database and queries)
- XAMPP (local Apache/PHP/MySQL stack)
- Wireshark + Npcap (packet capture and protocol analysis)
- draw.io (network topology diagram)

## Project structure

```
it-operations-portfolio/
├── 01-it-service-desk-asset-inventory/
│   ├── README.md
│   ├── sql/
│   │   ├── 01_schema.sql
│   │   ├── 02_seed_data.sql
│   │   └── 03_queries.sql
│   └── screenshots/
├── 02-network-traffic-analysis/
│   ├── README.md
│   ├── CAPTURE-GUIDE.md
│   ├── topology.svg
│   ├── capture.pcapng
│   └── screenshots/
├── troubleshooting-runbooks/
│   ├── wifi-connectivity.md
│   ├── password-reset.md
│   └── new-employee-setup.md
└── README.md
```

## Status

- [x] IT Service Desk and Asset Inventory Lab: osTicket deployed, configured, and tested end-to-end
- [x] IT Service Desk and Asset Inventory Lab: SQL asset inventory built, seeded, and queried
- [ ] Network Traffic Analysis and Documentation: in progress
- [x] Troubleshooting Runbooks: Wi-Fi, password reset, and new employee setup written

## About me

Celest Moreira | B.S. Management Information Systems, Long Beach State (May 2026) | [LinkedIn](https://linkedin.com/in/celest-moreira)
