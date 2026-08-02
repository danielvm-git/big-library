---
type: Metric
title: "Velocity"
category: "agile-planning"
era: "agile-scrum"
first_described_by: ["Ken Schwaber", "Jeff Sutherland"]
first_described_year: 1995
popularized_by: ["Mike Cohn", "Henrik Kniberg"]
definition: >
  The amount of work (usually in story points) a Scrum team completes per
  sprint. Used to forecast how many sprints remain for a backlog.
measurement: "Empirical, team-relative — not comparable across teams."
formula:
  name: "Velocity"
  definition: "Velocity = sum of story points for all backlog items marked 'Done' in a completed sprint."
  forecasting_use: "Sprints remaining = Total remaining story points / Average velocity (mean of last 3-6 sprints)."
  caveat: >
    Story points are relative/team-specific, so velocity cannot be compared
    between teams or used as an individual productivity metric — Cohn and
    Kniberg both warn against this explicitly.
still_used: true
superseded_by: []
sources:
  - book_slug: "agile-estimating-and-planning"
    author: "Mike Cohn"
    year: 2005
    pages: [42, 43, 44, 50, 56, 57]
  - book_slug: "scrum-and-xp-from-the-trenches"
    author: "Henrik Kniberg"
    year: 2007
    pages: [9, 11, 12, 29, 32, 33]
  - book_slug: "lean-software-development-an-agile-toolkit"
    author: "Mary Poppendieck"
    year: 2003
    pages: [48, 59, 60]
    note: "Poppendieck frames velocity within a Lean flow-efficiency critique."
  - book_slug: "leading-lean-software-development-results-are-not-the-point"
    author: "Mary Poppendieck"
    year: 2009
    pages: [20, 38, 59, 63, 64, 66]
  - book_slug: "sustainable-software-development-an-agile-perspective"
    author: "Kevin Tate"
    year: 2005
    pages: [158, 162, 163, 164, 165, 175]
  - book_slug: "implementation-playbook"
    author: "Ken Schwaber"
    year: 2005
    pages: [38, 43]
  - book_slug: "pmbok-6-edition-agile-practice-guide"
    author: "PMI"
    year: 2017
    pages: [73, 75, 76, 78, 94]
tags: ["scrum", "story points", "forecasting"]
---

# Velocity

Velocity emerged with Scrum in the mid-1990s as a lightweight forecasting tool,
replacing heavier estimation techniques from waterfall/PMBOK-style planning.
It is explicitly a relative, empirical measure — not an absolute productivity
metric — and both Cohn and Kniberg spend significant space warning against
comparing velocity across teams or using it to judge individuals. PMBOK 7
(2021) later adopted "velocity" as a standard term for agile/hybrid delivery
approaches (pages 340, 349), showing the metric's migration from the Agile
community into mainstream PM standards.
