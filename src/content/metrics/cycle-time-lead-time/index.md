---
type: Metric
title: "Cycle Time & Lead Time"
category: "flow"
era: "lean-toyota-production-system"
first_described_by: ["Taiichi Ohno"]
first_described_year: 1978
popularized_by: ["Jeffrey Liker", "Mary Poppendieck", "Mike Cohn"]
definition: >
  Lead Time: total elapsed time from when a request/order is made to when it
  is delivered. Cycle Time: elapsed time to actually process one unit of work
  once started (a subset of lead time — excludes queue/wait time).
measurement: "Timestamps captured at defined start/end events; commonly visualized via Cumulative Flow Diagrams or Value Stream Maps."
formula:
  name: "Cycle Time"
  definition: "Cycle Time = End timestamp of processing an item − Start timestamp of processing that item (work actively in progress)."
  related_formula:
    name: "Lead Time"
    definition: "Lead Time = Delivery timestamp − Request/order timestamp (includes all queue/wait time before work starts)."
  related_formula_2:
    name: "Takt Time"
    definition: "Takt Time = Available production time / Customer demand (units required in that period). Sets the target cadence, not a measured output like cycle time."
    origin: "Toyota Production System; German 'Takt' (musical measure/pace)."
still_used: true
superseded_by: []
sources:
  - book_slug: "the-toyota-way-14-management-principles-from-the-world-s-greatest-manufacturer"
    author: "Jeffrey Liker"
    year: 2003
    pages: [24, 37, 39, 40, 43, 46, 100, 101, 105, 107, 112, 113, 144, 153, 289]
  - book_slug: "lean-software-development-an-agile-toolkit"
    author: "Mary Poppendieck"
    year: 2003
    pages: [10, 54, 58]
  - book_slug: "agile-estimating-and-planning"
    author: "Mike Cohn"
    year: 2005
    pages: [250]
  - book_slug: "patterns-of-enterprise-application-architecture"
    author: "Martin Fowler"
    year: 2002
    pages: [95]
  - book_slug: "agile-software-development-ecosystems"
    author: "Jim Highsmith"
    year: 2002
    pages: [32, 178, 180, 182]
  - book_slug: "sustainable-software-development-an-agile-perspective"
    author: "Kevin Tate"
    year: 2005
    pages: [230]
  - book_slug: "leading-lean-software-development-results-are-not-the-point"
    author: "Mary Poppendieck"
    year: 2009
    pages: [31, 35, 54]
  - book_slug: "kanban-e-scrum-obtendo-o-melhor-de-ambos"
    author: "Henrik Kniberg & Mattias Skarin"
    year: 2010
    pages: [6, 42, 68, 69, 78, 79]
tags: ["lean", "kanban", "flow", "toyota production system"]
---

# Cycle Time & Lead Time

These are the oldest metrics in this catalog by origin — Taiichi Ohno formalized
them for Toyota's production system decades before software engineering
borrowed them via the Lean Software Development movement (Poppendieck, 2003)
and later Kanban for software (Kniberg & Skarin, 2010). The Toyota Way (Liker,
2003) is the primary source text; Lean Software Development explicitly maps
these manufacturing metrics onto software delivery flow. This lineage is the
direct ancestor of today's DORA "lead time for changes" metric.
