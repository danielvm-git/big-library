---
type: Metric
title: "Technical Debt"
category: "code-quality"
era: "agile-lean"
first_described_by: ["Ward Cunningham"]
first_described_year: 1992
popularized_by: ["Mary Poppendieck", "Alistair Cockburn", "Kevin Tate"]
definition: >
  A metaphor treating shortcuts taken to ship faster as a "loan" that accrues
  "interest" (extra future effort) until repaid (refactored). Originally
  qualitative; later formalized into estimable/trackable measures.
measurement: "No single universal formula; commonly estimated as remediation effort (hours/story points) via static-analysis tools (e.g. SonarQube's Technical Debt Ratio)."
formula:
  name: "Technical Debt Ratio (SonarQube-style, post-classic-text formalization)"
  definition: "TDR (%) = (Remediation Cost / Development Cost) × 100, where Remediation Cost = estimated hours to fix all flagged issues, Development Cost = estimated hours to build the code from scratch (often approximated from LOC)."
  caveat: >
    This ratio formula postdates the books in this catalog (popularized by
    static-analysis tooling in the 2010s); none of Cunningham, Poppendieck,
    Cockburn, or Tate specify a numeric formula — they treat technical debt
    as a qualitative decision-making metaphor.
still_used: true
superseded_by: []
sources:
  - book_slug: "leading-lean-software-development-results-are-not-the-point"
    author: "Mary Poppendieck"
    year: 2009
    pages: [21, 26, 37, 45, 46, 47]
  - book_slug: "sustainable-software-development-an-agile-perspective"
    author: "Kevin Tate"
    year: 2005
    pages: [3, 49, 50, 73, 83, 105]
    note: "Tate's central thesis frames sustainable pace/quality explicitly around avoiding technical debt accumulation."
  - book_slug: "agile-software-development-as-a-cooperative-game"
    author: "Alistair Cockburn"
    year: 2001
    pages: [182]
tags: ["metaphor", "code quality", "refactoring", "ward cunningham"]
---

# Technical Debt

Ward Cunningham coined the metaphor in a 1992 OOPSLA experience report, but it
had no formula — it was a communication tool for explaining refactoring needs
to non-technical stakeholders. Poppendieck's Leading Lean Software Development
(2009) and Kevin Tate's Sustainable Software Development (2005) both treat it
as a central management concept but, consistent with the metaphor's origin,
neither book supplies a calculation. The quantitative "Technical Debt Ratio"
in wide use today is a 2010s-era static-analysis-tooling invention, not
something these classic texts define — flagged here as a case where a metric
concept and its formula emerged decades apart.
