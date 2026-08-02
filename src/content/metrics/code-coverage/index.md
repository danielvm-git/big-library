---
type: Metric
title: "Code Coverage"
category: "test-quality"
era: "unit-testing"
first_described_by: ["J.C. Miller", "C.J. Maloney"]
first_described_year: 1963
popularized_by: ["Kent Beck", "Robert C. Martin"]
definition: >
  The percentage of source code (lines, branches, or paths) executed by a
  test suite. Used as a proxy — not a guarantee — for how well-tested a
  codebase is.
measurement: "Line coverage % = lines executed by tests / total executable lines. Branch/path coverage are stricter variants."
formula:
  name: "Line / Statement Coverage"
  definition: "Coverage % = (number of executable lines run by the test suite / total number of executable lines) × 100"
  variants:
    - name: "Branch Coverage"
      definition: "Coverage % = (number of decision branches executed by tests / total number of decision branches) × 100"
      note: "Stricter than line coverage — a fully-covered line can still hide an untested branch (e.g. one arm of an if)."
    - name: "Path Coverage"
      definition: "Coverage % = (number of distinct executable paths exercised / total number of distinct executable paths) × 100"
      note: "Most rigorous and least practical — path count grows combinatorially with branching (McCabe cyclomatic complexity approximates this count)."
  caveat: "100% coverage proves code was executed, not that it was correctly asserted — Clean Code frames it as a craftsmanship signal, not a correctness guarantee."
still_used: true
superseded_by: []
sources:
  - book_slug: "clean-code-a-handbook-of-agile-software-craftsmanship"
    author: "Robert C. Martin"
    year: 2008
    pages: [285, 315, 447]
    quote: >
      "I ran a code coverage analysis on the ComparisonCompactor using these
      tests. The code is 100 percent covered. Every line of code, every if
      statement and for loop, is executed by the tests."
tags: ["testing", "TDD", "quality gate"]
---

# Code Coverage

Code coverage predates TDD by decades (first formalized in 1963 test-path
analysis) but became a day-to-day developer metric through the unit-testing
and XP movements of the late 1990s–2000s. Clean Code (2008) treats 100%
coverage as a craftsmanship signal, not a target to game — a caution that
became more relevant as coverage requirements got codified into CI gates in
the 2010s–2020s (see planned Phase 2 notes on coverage-as-vanity-metric).
