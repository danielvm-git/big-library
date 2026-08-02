---
type: Metric
title: "WIP (Work In Progress) Limit"
category: "flow"
era: "kanban"
first_described_by: ["Taiichi Ohno (TPS origin)", "David J. Anderson (software Kanban formalization)"]
first_described_year: 2004
popularized_by: ["Henrik Kniberg", "Mattias Skarin"]
definition: >
  A cap on the number of work items allowed in a given workflow state at once,
  used to expose bottlenecks and enforce flow (per Little's Law).
measurement: "Set as a policy per column/state on a Kanban board; tracked as current count vs. limit."
formula:
  name: "Little's Law (the mathematical basis for WIP limits)"
  definition: "Average Cycle Time = Average WIP / Average Throughput"
  interpretation: >
    Rearranged: lowering WIP (with throughput held constant) mathematically
    reduces cycle time. This is why constraining WIP is the primary lever in
    Kanban, rather than working faster.
still_used: true
superseded_by: []
sources:
  - book_slug: "kanban-e-scrum-obtendo-o-melhor-de-ambos"
    author: "Henrik Kniberg & Mattias Skarin"
    year: 2010
    pages: [44, 81]
    quote: "Kanban limita WIP por estado de fluxo de trabalho, Scrum por iteração."
tags: ["kanban", "lean", "flow", "little's law"]
---

# WIP Limit

Rooted in Toyota Production System kanban cards, formalized for knowledge work
by David J. Anderson in the mid-2000s, and popularized for software teams by
Kniberg & Skarin's Kanban and Scrum: Making the Most of Both (2010), which
frames WIP limiting as Kanban's core mechanism versus Scrum's timeboxed
iterations. The underlying math is Little's Law from queuing theory (1961),
predating its software application by over 40 years — another case in this
catalog of a metric imported wholesale from an older discipline.
