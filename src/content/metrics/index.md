---
type: Bundle
title: "Software Metrics Catalog"
description: >
  Agent-readable OKF catalog of software engineering metrics as documented by
  classical SE, Lean, Agile, and PM authors, traced from origin through
  classic-text usage — with calculation formulas where the literature defines one.
---
# Metrics Catalog

## Code quality (structured design / OOP era)
- [Cohesion](./cohesion/index.md) — Constantine & Yourdon, 1974 · formula: LCOM
- [Coupling](./coupling/index.md) — Constantine & Yourdon, 1974 · formula: CBO, Ca/Ce
- [Cyclomatic Complexity](./cyclomatic-complexity/index.md) — McCabe, 1976 · formula: V(G)=E−N+2
- [Lines of Code (LOC/SLOC)](./lines-of-code-sloc/index.md) — industry practice, ~1960 · formula: SLOC count, COCOMO effort
- [Code Duplication (DRY)](./duplication/index.md) — Hunt & Thomas, 1999 · formula: duplicated-lines %
- [Technical Debt](./technical-debt/index.md) — Ward Cunningham, 1992 · qualitative (ratio formula postdates the books)

## Test & release quality
- [Code Coverage](./code-coverage/index.md) — Miller & Maloney, 1963 · formula: line/branch/path %
- [Defect Density](./defect-density/index.md) — QA industry, ~1975 · formula: defects / KLOC

## Agile flow & planning
- [Velocity](./velocity/index.md) — Schwaber & Sutherland, 1995 · formula: sum of completed story points
- [Cycle Time & Lead Time](./cycle-time-lead-time/index.md) — Ohno / Toyota, 1978 · formula: timestamp deltas, takt time
- [WIP Limit](./wip-limit/index.md) — Anderson (Kanban), 2004 · formula: Little's Law
- [Burndown Chart](./burndown-chart/index.md) — Schwaber, 2004 · formula: remaining-work delta

## Traditional / pre-Agile estimation & PM
- [Function Points](./function-points/index.md) — Albrecht (IBM), 1979 · formula: weighted UFP count
- [Earned Value (SV/CV/SPI/CPI)](./earned-value/index.md) — DoD PERT/Cost, 1967 · formula: EV−PV, EV−AC, EV/PV, EV/AC

---

## Library coverage

**Scanned with extractable text (13 PDFs):** Clean Code (Martin), Patterns of
Enterprise Application Architecture (Fowler), Domain-Driven Design (Evans),
Agile Software Development / Cooperative Game (Cockburn), Lean Software
Development (Poppendieck 2003), Implementing Lean SD (Poppendieck 2006),
Leading Lean SD (Poppendieck 2009), Scrum and XP from the Trenches (Kniberg),
Kanban and Scrum (Kniberg & Skarin), Agile Estimating and Planning (Cohn),
Agile Project Management with Scrum (Schwaber), Implementation Playbook
(Schwaber), Agile Software Development Ecosystems (Highsmith), Sustainable
Software Development (Tate), The Toyota Way (Liker), PMBOK 7th Ed., PMBOK 6th
Ed., PMBOK 6 Agile Practice Guide.

**Not yet scanned (extractable but not yet keyword-passed):** Joel Adams'
Agile Scrum User's Guide, Tim McCarthy's .NET DDD, AI_Assistant_Prompt_*.md
companion files (secondary sources, not primary book text).

**Present in library but no extractable PDF (`status: no-pdf` in the existing
OKF book collection — stub/metadata only):** Antifragile, Lean Thinking, The
Machine That Changed the World, Learning to See, Managing on Purpose,
Managing to Learn, The Lean Turnaround, Value Stream Mapping, Design a Better
Business, Fast/Forward, Getting the Right Things Done, The Phoenix Project.
These have companion `AI_Assistant_Prompt_*.md` files at the repo root for
some titles, which could be mined as a secondary source if a real PDF isn't
available — flagging for your call rather than fabricating page citations for
books without text.

**Duplicate files not reprocessed:** root PDFs with `booka_` / trailing-`a`
suffixes are exact or near-duplicates of canonical `book_*.pdf` files already
scanned (confirmed by matching file sizes) — skipped to avoid redundant
citations.

Each entry cites the specific book, author, year, and page numbers where the
metric is discussed (grounded in direct PDF extraction), plus the standard
calculation formula where one exists in the literature — noting explicitly
when a book only treats a metric qualitatively, or when the formula postdates
the source book (technical debt, duplication).
