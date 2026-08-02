---
type: Metric
title: "Cohesion"
category: "code-quality"
era: "structured-design"
first_described_by: ["Larry Constantine", "Edward Yourdon"]
first_described_year: 1974
popularized_by: ["Robert C. Martin"]
definition: >
  The degree to which the elements of a module (class, function) belong
  together — how closely related and focused a single class's responsibilities are.
  High cohesion means a class has one reason to change.
measurement: "Qualitative / structural (originally LCOM variants for quantitative measurement); no single universal formula in the classic texts."
formula:
  name: "LCOM (Lack of Cohesion of Methods)"
  origin: "Chidamber & Kemerer, 1994 (CK metrics suite) — the standard quantitative formalization of Constantine & Yourdon's qualitative concept."
  definition: >
    For a class with methods M1..Mn and instance variables {I1..Ik} used by each method:
    let P = number of method pairs that share NO instance variables,
    let Q = number of method pairs that share AT LEAST ONE instance variable.
    LCOM = max(0, P - Q)   [original 1991 Chidamber-Kemerer version]
  interpretation: "Higher LCOM = lower cohesion (methods don't share state, class may be doing too much). LCOM = 0 or negative means no cohesion problem detected."
  caveat: "Several incompatible LCOM variants exist (LCOM1-LCOM5); not present verbatim in Clean Code, which favors the qualitative heuristic 'small classes, few instance variables, methods use most of them.'"
still_used: true
superseded_by: []
sources:
  - book_slug: "clean-code-a-handbook-of-agile-software-craftsmanship"
    author: "Robert C. Martin"
    year: 2008
    pages: [171, 172]
    quote: >
      "Cohesion. Classes should have a small number of instance variables.
      Each of the methods of a class should manipulate one or more of those
      variables... Maintaining Cohesion Results in Many Small Classes."
  - book_slug: "domain-driven-design-tackling-complexity-in-the-heart-of-software"
    author: "Eric Evans"
    year: 2003
    pages: [107, 109, 110]
    note: "Discusses cohesion at the module/bounded-context level, not just class level."
tags: ["oop", "class design", "structured design", "SOLID"]
---

# Cohesion

Cohesion measures how tightly the responsibilities inside a single unit of code
(originally a module, later a class) belong together. It traces back to
Constantine & Yourdon's structured design work in the 1970s and was carried into
object-oriented design as one half of the coupling/cohesion pair that still
anchors most class-design heuristics today (see: Single Responsibility Principle).

Unlike coupling, cohesion in the classic texts referenced here (Clean Code, DDD)
is treated qualitatively rather than with a hard formula — contrast with academic
metrics like LCOM (Lack of Cohesion of Methods), which Clean Code does not cite
directly but which formalizes the same idea.
