---
type: Metric
title: "Burndown Chart"
category: "agile-planning"
era: "agile-scrum"
first_described_by: ["Ken Schwaber"]
first_described_year: 2004
popularized_by: ["Ken Schwaber", "Henrik Kniberg", "Mike Cohn"]
definition: >
  A chart plotting remaining work (story points or hours) against time,
  showing whether a sprint or release is trending toward completion.
measurement: "Remaining work re-measured at fixed intervals (daily for sprint burndown, per-sprint for release burndown)."
formula:
  name: "Burndown Data Point"
  definition: "Remaining Work(t) = Total Scope − Sum(Completed Work up to time t)"
  ideal_line: "Ideal Remaining(t) = Total Scope × (1 − t / Total Duration)  — a straight reference line from full scope to zero."
  interpretation: "Actual line above ideal = behind schedule / scope creep; below ideal = ahead of schedule."
still_used: true
superseded_by: []
sources:
  - book_slug: "agile-project-management-with-scrum"
    author: "Ken Schwaber"
    year: 2004
    pages: [31, 32, 33, 108, 110, 111]
  - book_slug: "scrum-and-xp-from-the-trenches"
    author: "Henrik Kniberg"
    year: 2007
    pages: [8, 11, 12, 61, 66, 72]
  - book_slug: "agile-estimating-and-planning"
    author: "Mike Cohn"
    year: 2005
    pages: [216, 217, 218, 219, 220, 221]
  - book_slug: "kanban-e-scrum-obtendo-o-melhor-de-ambos"
    author: "Henrik Kniberg & Mattias Skarin"
    year: 2010
    pages: [6, 68, 81, 114, 128, 134]
    note: "Contrasted against Kanban's Cumulative Flow Diagram as the flow-visualization alternative."
tags: ["scrum", "visualization", "forecasting"]
---

# Burndown Chart

Schwaber's Agile Project Management with Scrum (2004) is the earliest source
in this library to formalize the burndown chart as a standard Scrum artifact.
It became one of the most widely adopted Agile visualizations — appearing in
nearly every Agile-era book scanned for this catalog — precisely because it
requires no formula beyond simple subtraction, making it accessible to
non-technical stakeholders in the same way Cunningham's technical debt
metaphor was designed to be.
