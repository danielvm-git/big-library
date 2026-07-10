# big-library — AI Agents

> **Multi-agent context** — This file is the canonical project context for **Cline**, **Aider**, **OpenCode**, and other AGENTS.md-native tools. Claude Code and Cursor read it via the `CLAUDE.md` symlink, Gemini CLI via `GEMINI.md` symlink.

Read CONVENTIONS.md before any GitHub or git operation.

<!-- BEGIN bigpowers:context-routing -->
## Context Routing

Load subdirectory context by file glob — see project-specific routing table (seeded by `seed-conventions`).
<!-- END bigpowers:context-routing -->

<!-- BEGIN bigpowers:learned-preferences -->
## Learned User Preferences

- (none yet — updated via `session-state`)

## Workspace Facts

- (none yet — durable facts discovered across sessions)
<!-- END bigpowers:learned-preferences -->

<!-- BEGIN bigpowers:project -->
## Project

An AI-readable knowledge library built on BigBase, using OKF (Open Knowledge Format) markdown for structure.
Stack: Astro / Svelte / BigBase (Go)

## Commands

| Action | Command |
|--------|---------|
| Run | `npm run dev` |
| Test | `npm test` |
| Build | `npm run build` |
| Lint | `npm run lint` |
| Preflight | `npm run lint && npm run build && npm test` |
| CI | `gh pr checks` (when a PR is open) |

## Test

`npm test`

## Lint

`npm run lint`

## Build

`npm run build`

## Architecture

Astro SSG deployed on BigBase serving OKF Markdown books. A Svelte login page uses BigBase Auth for human access. An MCP server runs on a BigBase Function, guarded by a Bearer token, to serve knowledge chunks to AI agents.

## Conventions

- Use OKF (Open Knowledge Format) for content structure (YAML frontmatter + Markdown).
- Store JWT in browser for client-side Auth guard.
- MCP Server must read Pagefind index or Markdown chunks directly to minimize AI token usage.

## Never

- Never expose raw markdown content without checking the JWT token.
- Never allow MCP connections without Bearer token verification.
- Never dump entire books into the AI context; use chunks or specific chapters.
- Never dismiss reproducible gate failures as pre-existing or out of scope.
- Never proceed on red Preflight or red CI — invoke quick-fix or fix-bug first.

## Agent Rules

- **Workflow Mandate:** Use bigpowers skills (e.g. `plan-work`, `develop-tdd`) for structured work.
- **Always Green:** Preflight and CI must be green before forward work.
- Read specs/ and CONVENTIONS.md before writing code.
- Write the minimum code that solves the stated problem.
- Run tests after every change. Show evidence before declaring done.
- All planning output goes in specs/.
<!-- END bigpowers:project -->
