import os
import re

BOOKS_DIR = "src/content/books"
INDEX_FILE = "LIBRARY_INDEX.md"

def generate_index():
    books = []
    
    if not os.path.exists(BOOKS_DIR):
        print("No books directory found.")
        return

    for entry in os.listdir(BOOKS_DIR):
        if entry == "index.md":
            continue
            
        book_dir = os.path.join(BOOKS_DIR, entry)
        if os.path.isdir(book_dir):
            index_path = os.path.join(book_dir, "index.md")
            if os.path.exists(index_path):
                with open(index_path, "r", encoding="utf-8") as f:
                    content = f.read()
                
                # Simple regex to extract title
                title_match = re.search(r'^title:\s*"?(.*?)"?\s*$', content, re.MULTILINE)
                title = title_match.group(1) if title_match else entry
                
                books.append((title, index_path))
    
    # Sort books alphabetically by title
    books.sort(key=lambda x: x[0].lower())
    
    with open(INDEX_FILE, "w", encoding="utf-8") as f:
        f.write("# Big Library Index\n\n")
        f.write("This index is auto-generated from `src/content/books/`.\n\n")
        f.write("## Canonical Books Collection\n\n")
        for title, path in books:
            f.write(f"- **{title}** (`{path}`)\n")
            
    print("LIBRARY_INDEX.md generated successfully.")

if __name__ == "__main__":
    generate_index()
