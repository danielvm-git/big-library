# big-library — Claude Code

Read CONVENTIONS.md before any GitHub or git operation.

## Project
An AI-readable knowledge library built on BigBase, using OKF (Open Knowledge Format) markdown for structure.
Stack: Astro / Svelte / BigBase (Go)

## Commands
| Action | Command |
|--------|---------|
| Run    | `npm run dev` |
| Test   | `npm test` |
| Build  | `npm run build` |
| Lint   | `npm run lint` |

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

## Agent Rules
- **Workflow Mandate:** You MUST use the bigpowers skills (e.g. `plan-work`, `develop-tdd`, `orchestrate-project`) to perform tasks. DO NOT write code directly in response to a user prompt like "build this feature".
- Read specs/ before writing code.
- All planning and specifications MUST be written to `specs/` (`product/SCOPE_LATEST.yaml`, `release-plan.yaml`, `epics/`) before any code is generated.
- Write the minimum code that solves the stated problem. Nothing extra.
- Never refactor, rename, or reorganize code outside the task scope.
- Run tests after every change. Show evidence before declaring done.
- One clarifying question beats a wrong assumption baked into 200 lines.
