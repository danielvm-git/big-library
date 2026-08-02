---
type: Metric
title: "Lines of Code (LOC / SLOC)"
category: "size"
era: "earliest-software-metrics"
first_described_by: ["Software industry practice, formalized academically by the 1960s"]
first_described_year: 1960
popularized_by: ["Robert C. Martin", "Martin Fowler"]
definition: >
  A raw count of lines in a source file, function, or system — the oldest and
  most criticized software size metric, used as a rough proxy for size,
  complexity, or (historically) productivity/cost estimation.
measurement: "Raw line count, or SLOC (Source Lines of Code) which excludes blank lines and comments."
formula:
  name: "SLOC"
  definition: "SLOC = total lines − blank lines − comment-only lines"
  related_use: "Historically used as denominator in cost-estimation models (e.g. COCOMO, Boehm 1981: Effort = a × (SLOC)^b)."
  caveat: >
    Widely regarded as a poor complexity/productivity proxy since two
    functionally identical pieces of code can differ 10x in LOC depending on
    style — Clean Code and PoEAA both use LOC only descriptively, never
    prescriptively.
still_used: true
superseded_by: ["Cyclomatic Complexity", "function points (partially)"]
sources:
  - book_slug: "clean-code-a-handbook-of-agile-software-craftsmanship"
    author: "Robert C. Martin"
    year: 2008
    pages: [80, 100, 203, 204, 321, 454]
  - book_slug: "patterns-of-enterprise-application-architecture"
    author: "Martin Fowler"
    year: 2002
    pages: [112, 420]
tags: ["size metric", "legacy metric", "cocomo"]
---

# Lines of Code (LOC / SLOC)

The oldest metric in software engineering — informal since the earliest
mainframe programming, later formalized for cost-estimation models like
Boehm's COCOMO (1981). Clean Code and PoEAA use LOC only as a rough
descriptive gauge of function/class size, explicitly steering readers away
from LOC as a quality or productivity metric — reflecting decades of critique
that culminated in it being a canonical example of "vanity metric" gaming
(more lines ≠ more work; fewer lines can mean better *or* worse code).
