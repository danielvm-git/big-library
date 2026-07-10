# Contributing to Big Library

Thanks for contributing! Here's how to get started.

## Development Setup

```bash
git clone https://github.com/danielvm/big-library
cd big-library
npm ci
cd mcp-server && go build -o mcp-server main.go && cd ..
```

## Branching

- `main` — production, protected
- Feature branches: `feat/short-description`
- Bug fixes: `fix/short-description`

## Commit Convention

This project uses [Conventional Commits](https://www.conventionalcommits.org/) with semantic-release:

- `feat:` — new feature (triggers minor bump)
- `fix:` — bug fix (triggers patch bump)
- `docs:` — documentation only
- `chore:` — maintenance, CI, dependencies
- `refactor:` — code change that neither fixes a bug nor adds a feature
- `test:` — adding or fixing tests

## Before Submitting

1. Run `npm run lint` — must pass
2. Run `npm test` — must pass
3. Run `cd mcp-server && go test ./...` — must pass
4. Run `npm run build` — must succeed

## Pull Request Process

1. Open an issue first to discuss your proposal
2. Create a feature branch from `main`
3. Make your changes with [Conventional Commits](https://www.conventionalcommits.org/)
4. Ensure all checks pass locally
5. Open a PR against `main`
6. CI will run automatically — all checks must pass before merge

## Code Style

- Astro/Svelte: Prettier with `prettier-plugin-astro`
- Go: `gofmt` standard formatting
- Python: PEP 8

## Project Structure

See [README.md](README.md#project-structure) and [CONVENTIONS.md](CONVENTIONS.md) for architecture and conventions.

## Questions?

Open an issue or start a discussion.
