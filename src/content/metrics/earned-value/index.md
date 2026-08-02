---
type: Metric
title: "Earned Value (EVM: SV, CV, SPI, CPI)"
category: "project-management"
era: "pre-agile-pm"
first_described_by: ["US Department of Defense (PERT/Cost)"]
first_described_year: 1967
popularized_by: ["PMI / PMBOK"]
definition: >
  Earned Value Management quantifies project performance by comparing planned
  work, actual work completed, and actual cost — producing schedule and cost
  variance/performance indices.
measurement: "Requires three inputs per period: Planned Value (PV), Earned Value (EV), Actual Cost (AC)."
formula:
  name: "Schedule Variance (SV) / Cost Variance (CV)"
  definition: "SV = EV − PV.  CV = EV − AC.  (Negative = behind schedule / over budget.)"
  related_formula:
    name: "Schedule Performance Index (SPI) / Cost Performance Index (CPI)"
    definition: "SPI = EV / PV.  CPI = EV / AC.  (>1 = ahead/under budget, <1 = behind/over budget.)"
still_used: true
superseded_by: []
sources:
  - book_slug: "guia-pmbok-7a-edicao"
    author: "Project Management Institute"
    year: 2021
    pages: [291, 329, 331, 349]
    note: "PMBOK 7 pairs EVM (pages 329,349 — schedule/cost variance) alongside agile-era metrics like velocity and cycle time in the same 'measures' section."
  - book_slug: "lean-software-development-an-agile-toolkit"
    author: "Mary Poppendieck"
    year: 2003
    pages: [19]
    note: "Poppendieck critiques Earned Value as a poor fit for software, preferring flow-based measures."
tags: ["pmbok", "project management", "waterfall"]
---

# Earned Value Management (EVM)

EVM predates Agile software metrics by roughly three decades, originating in
US DoD cost-control systems (PERT/Cost, 1967) and becoming a PMI/PMBOK
standard. It's included here because PMBOK 7 (2021) explicitly repositions
EVM alongside agile flow metrics (velocity, cycle time, throughput) as
interchangeable "measures of project performance" depending on delivery
approach — a useful historical marker of PM and Agile metric vocabularies
converging. Poppendieck's Lean Software Development (2003) is more skeptical,
arguing EVM's cost/schedule framing doesn't capture value delivered.
