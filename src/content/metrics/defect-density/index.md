---
type: Metric
title: "Defect Density"
category: "quality"
era: "traditional-qa"
first_described_by: ["Software QA industry practice, formalized academically by the 1970s-80s"]
first_described_year: 1975
popularized_by: ["Jim Highsmith", "Kevin Tate"]
definition: >
  The number of confirmed defects normalized by a size measure (usually
  KLOC — thousand lines of code — or function points), used to compare
  quality across modules, releases, or teams.
measurement: "Defects tracked via bug trackers; size measured via LOC or function points at the time of the release being assessed."
formula:
  name: "Defect Density"
  definition: "Defect Density = Total Confirmed Defects / Size (KLOC or Function Points)"
  related_formula:
    name: "Escaped Defect Rate"
    definition: "Escaped Defects (%) = Defects found in production / Total defects found (pre-release + post-release)"
    note: "A related but distinct metric — measures QA-process effectiveness rather than raw code quality."
still_used: true
superseded_by: []
sources:
  - book_slug: "agile-software-development-ecosystems"
    author: "Jim Highsmith"
    year: 2002
    pages: [100]
  - book_slug: "sustainable-software-development-an-agile-perspective"
    author: "Kevin Tate"
    year: 2005
    pages: [176]
  - book_slug: "leading-lean-software-development-results-are-not-the-point"
    author: "Mary Poppendieck"
    year: 2009
    pages: [55, 61, 70]
    note: "Discussed as 'escaped defects' rather than defect density per se."
tags: ["quality", "qa", "size-normalized"]
---

# Defect Density

One of the oldest quality metrics carried into Agile-era books largely as a
cautionary reference — Highsmith and Tate both note its size-normalization
(KLOC) inherits all of Lines of Code's weaknesses. Poppendieck's Leading Lean
Software Development instead pushes teams toward the related but distinct
"escaped defect rate," which measures how much a QA process actually catches
before release rather than raw defect count against size.
