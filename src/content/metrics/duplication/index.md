---
type: Metric
title: "Code Duplication (DRY violation)"
category: "code-quality"
era: "refactoring-era"
first_described_by: ["Andy Hunt", "Dave Thomas (DRY principle, The Pragmatic Programmer, 1999)"]
first_described_year: 1999
popularized_by: ["Martin Fowler", "Eric Evans", "Robert C. Martin"]
definition: >
  The presence of repeated logic/structure across a codebase, violating the
  "Don't Repeat Yourself" principle — treated as a code smell that increases
  maintenance risk (a fix in one copy that's missed in another).
measurement: "Detected via clone-detection tools (e.g. PMD CPD, SonarQube) comparing token sequences across files."
formula:
  name: "Duplicated Lines Density"
  definition: "Duplication (%) = (Duplicated Lines / Total Lines) × 100"
  detection_note: "Clone detectors classify duplication into Type 1 (exact copy), Type 2 (renamed identifiers), Type 3 (near-miss with small edits), Type 4 (semantically equivalent, different syntax) — increasingly hard to detect in that order."
still_used: true
superseded_by: []
sources:
  - book_slug: "patterns-of-enterprise-application-architecture"
    author: "Martin Fowler"
    year: 2002
    pages: [39, 40, 54, 55, 95, 101]
  - book_slug: "domain-driven-design-tackling-complexity-in-the-heart-of-software"
    author: "Eric Evans"
    year: 2003
    pages: [193, 197, 198, 202, 218, 238]
  - book_slug: "clean-code-a-handbook-of-agile-software-craftsmanship"
    author: "Robert C. Martin"
    year: 2008
    note: "Duplication listed as Simple Design Rule #2 (see 'Emergence' chapter, page 203 region)."
  - book_slug: "agile-software-development-as-a-cooperative-game"
    author: "Alistair Cockburn"
    year: 2001
    pages: [171]
  - book_slug: "agile-software-development-ecosystems"
    author: "Jim Highsmith"
    year: 2002
    pages: [102, 118]
tags: ["dry", "refactoring", "code smell", "clone detection"]
---

# Code Duplication

DRY was named by Hunt & Thomas in The Pragmatic Programmer (1999, not itself
in this library, but the principle every book here inherits). Every major
architecture and craftsmanship text scanned — PoEAA, DDD, Clean Code, Cockburn,
Highsmith — treats duplication as a top code smell, though only tooling built
after these books (PMD/CPD, SonarQube) formalized a quantitative duplication
percentage. As with Technical Debt, this is a case of a widely-cited concept
predating its own measurement formula by a decade or more.
