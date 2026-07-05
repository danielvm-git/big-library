# Big Library

![License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)

> A highly secure, statically generated knowledge library that natively leverages BigBase Auth, routing, and functions to serve human-readable books and AI-readable MCP chunks.

An AI-readable knowledge library built on BigBase, using OKF (Open Knowledge Format) markdown for structure. It is designed to house Agile, Lean, and PMBOK methodologies and present them beautifully to authenticated human users while remaining structurally perfect for autonomous AI agents.

By using an Astro SSG frontend paired with BigBase Auth and routing, raw markdown content is strictly protected. An integrated BigBase Go serverless function acts as an MCP Server, providing highly efficient sub-second access to library content for AI workflows by querying a statically generated Pagefind index.

## Prerequisites

- **Runtime**: Node.js v18+ and Go 1.21+
- **Package manager**: npm
- **Platform CLI**: BigBase CLI for deployment

## Installation

```bash
git clone https://github.com/danielvm-git/big-library.git
cd big-library
npm install
```

## Usage

```bash
# Start local development server
npm run dev

# Build the SSG site for production
npm run build
```

## Features

- **BigBase Native Authentication**: Svelte login page tightly integrated with BigBase JWT Auth for robust route protection.
- **SSG Architecture**: Built on Astro, ensuring maximum speed, SEO readiness, and zero unauthenticated database connections.
- **April Green Design System**: Implements a highly premium, modern, glassmorphic UI using the official BigBase Design System.
- **AI-Optimized Storage**: Uses Open Knowledge Format (OKF) with YAML frontmatter.
- **MCP Go Serverless Function**: Exposes knowledge directly to AI Agents efficiently via a Pagefind JSON search index.

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `JWT_SECRET` | `TODO` | Secret key for verifying BigBase Auth tokens |
| `MCP_PORT` | `TODO` | Port for the local MCP testing server |

## Development

```bash
git clone https://github.com/danielvm-git/big-library.git
cd big-library
npm install
npm run dev
```

## Tests

```bash
npm test
npm run lint
```

## Contributing

1. Fork the repo.
2. Create a feature branch (`git checkout -b feature/my-thing`).
3. Commit changes (`git commit -am 'Add my thing'`).
4. Push (`git push origin feature/my-thing`).
5. Open a Pull Request.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) or [Releases](https://github.com/user/repo/releases).

## Links

- Repository: TODO (Update with actual repo URL)
- Issue tracker: TODO (Update with actual issues URL)

## License

MIT — see [LICENSE](LICENSE) for details.

## Credits

Built with [bigpowers](https://github.com/danielvm-git/bigpowers) orchestration methodology.
