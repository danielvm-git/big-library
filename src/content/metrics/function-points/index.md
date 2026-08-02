---
type: Metric
title: "Function Points"
category: "size"
era: "pre-agile-estimation"
first_described_by: ["Allan Albrecht (IBM)"]
first_described_year: 1979
popularized_by: ["Ken Schwaber", "Jim Highsmith", "Alistair Cockburn"]
definition: >
  A technology-independent size measure based on counting a system's user-
  facing functionality (inputs, outputs, inquiries, files, interfaces) rather
  than lines of code — designed to allow cost/effort comparison across
  languages and platforms.
measurement: "Manual counting exercise weighted by complexity classification (simple/average/complex) for each function type."
formula:
  name: "Unadjusted Function Points (UFP)"
  definition: >
    UFP = Σ (count of each function type × its complexity weight), summed
    across 5 categories: External Inputs, External Outputs, External Inquiries,
    Internal Logical Files, External Interface Files. Each category has
    simple/average/complex weights (e.g. EI: 3/4/6).
  related_use: "Adjusted Function Points = UFP × Value Adjustment Factor (0.65-1.35, based on 14 general system characteristics)."
  caveat: "Counting is subjective and labor-intensive — a major reason Agile teams (Cohn, Schwaber) shifted to relative story points instead."
still_used: true
superseded_by: ["Story Points (in Agile contexts)"]
sources:
  - book_slug: "agile-project-management-with-scrum"
    author: "Ken Schwaber"
    year: 2004
    pages: [122]
  - book_slug: "agile-software-development-ecosystems"
    author: "Jim Highsmith"
    year: 2002
    pages: [49, 181, 211, 217]
  - book_slug: "agile-software-development-as-a-cooperative-game"
    author: "Alistair Cockburn"
    year: 2001
    pages: [58]
  - book_slug: "leading-lean-software-development-results-are-not-the-point"
    author: "Mary Poppendieck"
    year: 2009
    pages: [38]
tags: ["size metric", "estimation", "pre-agile"]
---

# Function Points

Developed at IBM by Allan Albrecht (1979) to fix Lines of Code's biggest flaw:
LOC isn't comparable across languages. Function Points measure delivered
functionality instead. Every major pre-Agile-to-Agile transition book in this
library references them as the estimation baseline Agile methods reacted
against — Schwaber and Highsmith cite them as the incumbent approach; Cohn's
Agile Estimating and Planning implicitly positions story points as their
lighter-weight successor.
