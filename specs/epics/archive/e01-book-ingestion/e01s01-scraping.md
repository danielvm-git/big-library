### Story [e01s01]: Convert PDF & Raw Scrapes to OKF — Implementation Steps

**type:** feat
**risk:** P0
**context:** domain

**Context**: This story updates the existing `migrate_to_okf.py` script to not only parse metadata from `.txt` files but also ingest the raw book text. This requires extracting text from `book_*.pdf` files (using a Python library like `PyPDF2` or `pymupdf`) and parsing the `AI_Assistant_Prompt_*.md` raw scrapes. All generated OKF markdown files must be placed directly into `src/content/books/` rather than the root `books/` directory, to be compatible with Astro's Content Collections.

## Steps

1. Update `migrate_to_okf.py` to set the output directory to `src/content/books/` instead of `books/` → verify: `grep "src/content/books" migrate_to_okf.py`
2. Add PDF text extraction capability to `migrate_to_okf.py` using `PyPDF2` or `pymupdf`, saving the text body below the YAML frontmatter in `index.md`. If a PDF exists, set `status: ok` instead of `status: no-pdf` → verify: `grep -E "PyPDF2|fitz|pypdf" migrate_to_okf.py`
3. Add logic to ingest `AI_Assistant_Prompt_*.md` files when a PDF is not present but a scrape is, injecting their text into the corresponding `index.md` body → verify: `grep "AI_Assistant_Prompt" migrate_to_okf.py`
4. Run the updated `migrate_to_okf.py` to process all files and generate the `src/content/books` structure → verify: `ls -la src/content/books`
5. Verify that books with PDFs or Scrapes no longer have `status: no-pdf` → verify: `grep -L "status: no-pdf" src/content/books/*/index.md`

## Verification Script (Step-by-Step)

1. Make sure Python 3 and PDF extraction dependencies (e.g. `pip install PyPDF2`) are installed.
2. Run `python3 migrate_to_okf.py`.
3. Check `src/content/books/`. It should contain a folder for each book.
4. Open one of the generated `index.md` files (e.g. `src/content/books/the-toyota-way/index.md`). It should have YAML frontmatter (`type: Book`, `status: ok`) and the full text of the book or scrape below the `---`.

## Out of scope

- Updating `LIBRARY_INDEX.md` (handled in story e01s02).
- Building the frontend Astro app (handled in epic e02).

## Risks

- PDF extraction can be messy and memory-intensive for large books. The script should handle errors gracefully and skip unreadable PDFs.
- Mapping `AI_Assistant_Prompt` filenames to book titles might be tricky if names don't match perfectly.
