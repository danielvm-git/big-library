# Technical Architecture & Stack

## Domain
Big Library: An AI-readable knowledge base serving OKF (Open Knowledge Format) chunks for Agile, Lean, and Project Management methodologies.

## Core Stack
- **Frontend Framework**: Astro (Static Site Generation - SSG)
- **UI Components**: Svelte (for interactive elements like the Login flow)
- **Styling**: BigBase Design System (Pure CSS with Semantic HTML, April Green aesthetic)
- **Backend / Host**: BigBase (Go)

## Architectural Decisions
1. **Content Storage**: OKF Markdown files are stored natively in Astro's `src/content/` collections for static generation at build time.
2. **Security & Authentication**: 
   - BigBase handles JWT authentication.
   - BigBase strictly enforces JWT checks at the routing/hosting layer, intercepting requests to protect the static HTML/Markdown assets from unauthenticated access.
3. **Search & Indexing**: 
   - The Astro build process integrates **Pagefind** to generate a lightweight, static JSON search index of all OKF chunks.
4. **MCP Server Integration**: 
   - The MCP Server runs purely as a BigBase Go function, entirely detached from the Astro frontend. 
   - It queries the Pagefind JSON index to fetch relevant OKF chunks efficiently, minimizing AI context token usage.
   - It strictly requires and validates Bearer tokens before responding.
