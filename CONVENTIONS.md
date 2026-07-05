# big-library Conventions

## Architecture
- **Frontend:** Astro (SSG/Content Collections) for static generation and Svelte for interactive components (like login).
- **Backend/Host:** BigBase (Go). Uses `auth` component for JWTs, `deploy`/`git` for hosting Astro, and `functions` (or native `mcp`) for the MCP server.

## Code Quality
- Readability First: Clear variable/function names.
- KISS: Simplest solution that works.
- DRY: Extract shared logic.
- YAGNI: Don't build what isn't needed yet.

## Astro / Svelte Conventions
- Content Collections: Store all books in `src/content/books/` using OKF schema.
- Routing: Use Astro's file-based routing.
- Client-side Guard: Svelte components handle JWT verification and redirect.

## Specs Convention
All planning and specifications live in `specs/`. Before writing any code, read `specs/` and write a plan to `specs/PLAN.md` (or use `plan-work`).

## Defensive Code Categories
- **Rate limit:** Important for the MCP token endpoint to prevent abuse.
- **Retry:** Implement retry with backoff for fetching from BigBase Auth.
- **Graceful degradation:** If auth service is slow, handle state gracefully in the UI.

## Security
- No secrets in code. Use env vars.
- Validate JWT on the client side (Svelte guard) and on the MCP server (Bearer token).
- Never expose raw content without authentication.
