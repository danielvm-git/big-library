# Big Library — AI-Readable Knowledge Library

An AI-readable knowledge library built on BigBase using OKF (Open Knowledge Format) markdown. Astro SSG frontend with Svelte interactive components, BigBase Auth for human access, and a Go MCP server for AI agent consumption.

## Motivation

AI agents need structured, queryable knowledge — not raw PDFs or flat markdown dumps. Big Library ingests books, converts them to OKF (Open Knowledge Format), indexes them with Pagefind for fast search, and exposes them through both a human-readable Astro site and an MCP server for AI tool use. Every book is chunked, tagged with Diátaxis categories, and served with minimal token overhead.

## Build Status

[![CI/CD](https://github.com/danielvm/big-library/actions/workflows/ci-cd.yml/badge.svg)](https://github.com/danielvm/big-library/actions/workflows/ci-cd.yml)

## Tech / Framework

**Built with**

- [Astro 5](https://astro.build) — SSG with Content Collections
- [Svelte](https://svelte.dev) — interactive components (auth guards)
- [BigBase](https://bigbase.click) — Go-based hosting, auth, and serverless functions
- [Pagefind](https://pagefind.app) — static search indexing
- [OKF](https://github.com/danielvm/okf) — Open Knowledge Format for structured content
- [Go](https://go.dev) — MCP server implementation

## Features

- **OKF content pipeline** — PDF ingestion → structured markdown with YAML frontmatter
- **Diátaxis categorization** — books tagged as tutorial, how-to, reference, or explanation
- **Pagefind full-text search** — static index built at deploy time, zero server cost
- **JWT-auth gated access** — Svelte login flow backed by BigBase Auth
- **MCP server** — Go serverless function serving knowledge chunks to AI agents via Bearer token
- **Semantic release** — automated versioning and changelog generation

## Project Structure

```
/
├── src/                  # Astro frontend
│   ├── content/books/    # OKF markdown books
│   ├── components/       # Astro + Svelte components
│   ├── layouts/          # Page layouts
│   └── pages/            # Routes
├── mcp-server/           # Go MCP server
├── books/                # Raw ingested books (OKF format)
├── scripts/              # Ingestion & utility scripts
│   ├── migrate_to_okf.py
│   ├── add_diataxis.py
│   └── generate_index.py
├── specs/                # Planning & specifications (bigpowers)
└── .github/workflows/    # CI/CD pipeline
```

## Installation

```bash
# Clone
git clone https://github.com/danielvm/big-library
cd big-library

# Install frontend dependencies
npm ci

# Build MCP server
cd mcp-server && go build -o mcp-server main.go && cd ..

# Start dev server
npm run dev
```

## Commands

| Command | Action |
|---------|--------|
| `npm run dev` | Start Astro dev server (`localhost:4321`) |
| `npm run build` | Build production site to `dist/` |
| `npm run preview` | Preview production build locally |
| `npm test` | Run test suite |
| `npm run lint` | Run linter |
| `go test ./...` | Run Go MCP server tests (from `mcp-server/`) |
| `go build -o mcp-server main.go` | Build MCP server binary |

## Tests

```bash
# Frontend
npm test

# MCP Server
cd mcp-server && go test ./...
```

## How to Use

```bash
# Development
npm run dev                # localhost:4321

# Build for production
npm run build              # output in dist/

# Preview the build
npm run preview

# Deploy happens automatically via CI/CD on push to main
```

## CI/CD

Push to `main` triggers:
1. Semantic release (version bump + changelog)
2. Frontend build (`npm run build`)
3. MCP server build (`go build`)
4. Test suite (frontend + Go)
5. Deploy to BigBase via scoped token
6. Health check with retry loop

## Contribute

Contributions welcome. Please open an issue first to discuss your proposal.

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/amazing`)
3. Commit changes (`git commit -m 'feat: add amazing thing'`)
4. Push (`git push origin feat/amazing`)
5. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

## License

MIT © [Daniel VM](https://github.com/danielvm)
