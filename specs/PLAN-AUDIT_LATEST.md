# Plan Audit — big-library
**Date:** 2026-07-05 · **Verdict:** READY (with pre-build notes)

## Summary

Epics renumbered to match build order: **e01 Book Ingestion → e02 Astro Frontend → e03 MCP Server**. Scope, release index, task YAML, and `state.yaml` are aligned. One pre-build documentation gap remains (story spec `.md` files referenced by `epic.yaml`).

## Principles Alignment

| Check | Status | Note |
|-------|--------|------|
| Vertical slices | ✅ | Each epic has 2 independently verifiable stories |
| Scope bounded | ✅ | Ingestion in `in_scope`; `out_of_scope` and `constraints` present |
| Success criteria | ✅ | Content ingestion criteria added to `SCOPE_LATEST.yaml` |
| HARD GATE candidates | ✅ | e01 (ingestion) is first in `release-plan.yaml` and `active_epic_id: e01` |
| Domain language | ✅ | OKF, Pagefind, BigBase Auth/MCP used consistently |

## Conventions Completeness

| Check | Status | Note |
|-------|--------|------|
| `CLAUDE.md` / `AGENTS.md` | ✅ | Present |
| `CONVENTIONS.md` | ✅ | Present |
| `specs/` layout | ✅ | Complete |
| Conventional Commits | ⚠️ | Not in `CONVENTIONS.md` (non-blocking for Hermes handoff) |
| Git workflow mode | ✅ | `solo-git` |

## Pre-flight Answers

| Question | Value |
|----------|-------|
| test | `npm test` (after e02s01 scaffolds Astro) |
| build | `npm run build` (after e02s01) |
| lint | `npm run lint` (after e02s01) |
| typecheck | TBD — add `astro check` when e02s01 lands |
| CI platform | None yet — wire after e02s01 |
| Solo or team | `solo-git` |
| Primary stack | Astro + Svelte + BigBase Go |
| Codebase phase | Pre-build — raw content assets present; app not scaffolded |

## Epic Sequence (renumbered)

| ID | Title | WSJF | Capsule |
|----|-------|------|---------|
| e01 | Book Ingestion & OKF Content Pipeline | 8.3 | `epics/e01-book-ingestion` |
| e02 | Astro Frontend & BigBase Auth | 8.5 | `epics/e02-astro-frontend` |
| e03 | Pagefind Index & Go MCP Server | 7.2 | `epics/e03-mcp-server` |

## Open Gaps (non-blocking)

- [ ] Story spec markdown files (`e01s01-scraping.md`, etc.) — run `plan-work` on e01 before or during first build story
- [ ] Document PDF source location for e01s01 (PDFs gitignored; not in repo)
- [ ] Conventional Commits in `CONVENTIONS.md` (optional)
- [ ] CI workflow after e02s01 scaffolds npm scripts

## Verdict

**READY** — proceed with Hermes handoff on e01. Agents should read `AGENTS.md`, `specs/state.yaml`, and `specs/epics/e01-book-ingestion/` first.

## Recommended Next Skills

1. `plan-work` on `specs/epics/e01-book-ingestion/` (story `.md` specs)
2. `build-epic` starting at e01
3. `setup-environment` again after e02s01 creates `package.json`
