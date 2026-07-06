### Story [e01s02]: Sync src/content/books with LIBRARY_INDEX.md — Implementation Steps

**type:** refactor
**risk:** P1
**context:** domain

**Context**: This story handles aligning the legacy `LIBRARY_INDEX.md` document with the newly generated OKF content structure located in `src/content/books/`. It ensures that all paths in the index correctly reference the generated files and that the library index correctly reflects the availability of PDF content vs plain-text AI scrapes.

## Steps

1. Parse the existing `LIBRARY_INDEX.md` to identify all referenced book paths. → verify: `cat LIBRARY_INDEX.md | grep "\.pdf" || true`
2. Update the `LIBRARY_INDEX.md` file to reflect the new `src/content/books/*/index.md` canonical locations instead of raw PDF paths or raw AI prompts. → verify: `grep "src/content/books" LIBRARY_INDEX.md`
3. Cross-reference the items in `LIBRARY_INDEX.md` with the directories generated in `src/content/books/` to ensure no items are missing. → verify: `ls -la src/content/books/`

## Verification Script (Step-by-Step)

1. Open `LIBRARY_INDEX.md`.
2. Verify that all links pointing to individual books are routed to the `src/content/books/*/index.md` location.
3. Confirm that no `.pdf` or `AI_Assistant_Prompt_*.md` files are linked directly in the library index, unless as external attachments in the OKF structure.

## Out of scope

- Creating the OKF files (handled in e01s01).
- Astro UI display of the index (handled in epic e02).

## Risks

- Links might break if slugification algorithms in the index generation don't perfectly match the `migrate_to_okf.py` output. We will need to be careful with exact slug matching.
