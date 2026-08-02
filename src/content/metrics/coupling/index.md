---
type: Metric
title: "Coupling"
category: "code-quality"
era: "structured-design"
first_described_by: ["Larry Constantine", "Edward Yourdon"]
first_described_year: 1974
popularized_by: ["Robert C. Martin", "Martin Fowler", "Eric Evans"]
definition: >
  The degree of interdependence between software modules — how much a change
  in one module forces a change in another. Lower coupling is preferred.
measurement: "Qualitative in the classic OOP texts; formalized later as afferent/efferent coupling (see related metric)."
formula:
  name: "CBO (Coupling Between Objects)"
  origin: "Chidamber & Kemerer, 1994 (CK metrics suite)."
  definition: >
    CBO(class C) = count of other classes to which C is coupled
    (C calls a method or accesses an instance variable of the other class, or vice versa).
    Simple integer count, not a ratio.
  interpretation: "Higher CBO = more classes that must be understood/retested when C changes. No universal 'good' threshold; commonly flagged above ~14."
  related_formula:
    name: "Afferent (Ca) / Efferent (Ce) Coupling"
    origin: "Robert C. Martin, 'OO Design Quality Metrics' paper, 1994 — same author as Clean Code, but the formula itself is not printed in Clean Code."
    definition: >
      Ca = number of classes outside a package that depend on classes inside it.
      Ce = number of classes inside a package that depend on classes outside it.
    see_metric: "instability-abstractness"
still_used: true
superseded_by: []
sources:
  - book_slug: "clean-code-a-handbook-of-agile-software-craftsmanship"
    author: "Robert C. Martin"
    year: 2008
    pages: [181, 191, 195, 203, 209]
  - book_slug: "patterns-of-enterprise-application-architecture"
    author: "Martin Fowler"
    year: 2002
    pages: [33, 37, 101, 104, 121, 178, 184, 304]
    note: "Coupling drives much of the rationale for layering patterns (e.g. Gateway, Repository, Mapper) in enterprise architecture."
  - book_slug: "domain-driven-design-tackling-complexity-in-the-heart-of-software"
    author: "Eric Evans"
    year: 2003
    pages: [74, 76, 77, 83, 106, 107, 108, 110]
    note: "Coupling discussed at the Bounded Context level via Context Maps."
tags: ["architecture", "class design", "structured design"]
---

# Coupling

Coupling is the counterpart to cohesion: how entangled one unit of code is with
another. It is one of the oldest software metrics, introduced in Constantine &
Yourdon's structured design work (1974), and every book in this catalog that
touches architecture (Clean Code, PoEAA, DDD) treats reducing coupling as a
central design goal — but at different scales: Clean Code at the class level,
PoEAA at the layer/pattern level, and DDD at the Bounded Context level.

See also: Afferent/Efferent Coupling, Instability & Abstractness (Robert Martin's
later quantitative formalization of this same concept in his metrics package
papers, referenced but not spelled out numerically in Clean Code itself).
