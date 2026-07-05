import os
import re
import shutil

LIBRARY_DIR = "."
BOOKS_DIR = os.path.join(LIBRARY_DIR, "books")

if not os.path.exists(BOOKS_DIR):
    os.makedirs(BOOKS_DIR)

# Ensure books/index.md exists
with open(os.path.join(BOOKS_DIR, "index.md"), "w") as f:
    f.write("---\ntype: Bundle\ntitle: All Books\n---\n# Library\n")

def slugify(text):
    text = text.lower()
    text = re.sub(r'[^a-z0-9]+', '-', text)
    return text.strip('-')

for filename in os.listdir(LIBRARY_DIR):
    if filename.startswith("book_") and filename.endswith(".txt"):
        filepath = os.path.join(LIBRARY_DIR, filename)
        
        with open(filepath, "r", encoding="utf-8") as f:
            lines = f.readlines()
        
        metadata = {}
        for line in lines:
            # Strip line numbers like "1: Title: ..." if they exist
            line = re.sub(r'^\d+:\s+', '', line).strip()
            if ':' in line:
                key, val = line.split(':', 1)
                metadata[key.strip().lower()] = val.strip()
        
        if 'title' not in metadata:
            continue
            
        title = metadata['title']
        slug = slugify(title)
        
        book_dir = os.path.join(BOOKS_DIR, slug)
        if not os.path.exists(book_dir):
            os.makedirs(book_dir)
            
        # Parse fields for YAML
        authors_raw = metadata.get('authors', '')
        authors_list = [a.strip() for a in authors_raw.replace(' and ', ',').split(',')]
        authors_str = "[" + ", ".join([f'"{a}"' for a in authors_list if a]) + "]"
        
        topics_raw = metadata.get('topics', '')
        topics_list = [t.strip().lower() for t in topics_raw.split(',')]
        tags_str = "[" + ", ".join([f'"{t}"' for t in topics_list if t]) + "]"
        
        year = metadata.get('year', '')
        isbn = metadata.get('isbn', '')
        publisher = metadata.get('publisher', '')
        link = metadata.get('link', '')
        
        # Write OKF index.md
        index_path = os.path.join(book_dir, "index.md")
        with open(index_path, "w", encoding="utf-8") as f:
            f.write("---\n")
            f.write("type: Book\n")
            f.write(f"title: \"{title}\"\n")
            if authors_list:
                f.write(f"authors: {authors_str}\n")
            if isbn:
                f.write(f"isbn: {isbn}\n")
            if year:
                f.write(f"year: {year}\n")
            if publisher:
                f.write(f"publisher: \"{publisher}\"\n")
            if topics_list:
                f.write(f"tags: {tags_str}\n")
            f.write("status: no-pdf\n")
            if link:
                f.write("links:\n")
                f.write(f"  external: {link}\n")
            f.write("---\n")
            
        print(f"Migrated {title} -> books/{slug}/index.md")

print("Migration complete!")
