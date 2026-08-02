---
type: Metric
title: "Cyclomatic Complexity (McCabe)"
category: "code-quality"
era: "structured-programming"
first_described_by: ["Thomas J. McCabe"]
first_described_year: 1976
popularized_by: ["Mary Poppendieck"]
definition: >
  Counts the number of linearly independent paths through a program's
  control-flow graph — a proxy for how hard a function/method is to test and
  understand.
measurement: "Derived from the control-flow graph of a function."
formula:
  name: "Cyclomatic Complexity (V(G))"
  definition: "V(G) = E − N + 2P  (E = edges, N = nodes, P = connected components; for a single function P=1, so V(G) = E − N + 2)."
  simplified_rule_of_thumb: "V(G) = number of decision points (if, for, while, case, &&, ||) + 1"
  interpretation: "Also equals the minimum number of test cases needed for full branch coverage. Common thresholds: 1-10 simple, 11-20 moderate risk, >20 high risk/needs refactoring."
still_used: true
superseded_by: []
sources:
  - book_slug: "implementing-lean-software-development-from-concept-to-cash"
    author: "Mary Poppendieck"
    year: 2006
    pages: [58]
    note: "Indexed as 'McCabe Cyclomatic Complexity Index' (original book pages 194-195); discussed as a code-quality measure Lean teams track alongside cycle time."
tags: ["complexity metric", "control flow", "testing", "mccabe"]
---

# Cyclomatic Complexity

Introduced by Thomas McCabe in 1976, this is one of the few software metrics
with a hard, uncontested mathematical formula (derived from graph theory) and
a direct practical use: it's simultaneously a complexity score and the exact
minimum number of tests needed for full branch coverage — linking this metric
directly to Code Coverage in this catalog. Poppendieck's Implementing Lean
Software Development (2006) references it as a standard code-quality gate
Lean/Agile teams use alongside flow metrics like cycle time.
