# e02s01: Astro Setup with BigBase DS

## 1. Description
This story initializes the Astro SSG project for Big Library, integrating Svelte components and the April Green BigBase Design System CSS. 
It establishes the static site generation structure that reads OKF chunks from `src/content/books/` and uses `LIBRARY_INDEX.md` as the canonical source of truth for the library layout.

## 2. Success Criteria
- Astro is initialized in the repository.
- Svelte integration is added to Astro (`@astrojs/svelte`).
- The April Green BigBase Design System CSS is included globally.
- The `prototype.html` static layout is ported into an Astro layout (`Layout.astro`) and an `index.astro` page.
- `npm run build` successfully compiles the static site.

## 3. Implementation Tasks
1. Initialize Astro project with SSG and Svelte integration
2. Integrate April Green BigBase Design System CSS
3. Migrate prototype.html to Astro layout and pages

## 4. Test Plan
- Verify local dev server `npm run dev` renders the migrated layout properly.
- Verify `npm run build` completes without errors.
