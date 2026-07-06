import os
import re
import shutil
from pypdf import PdfReader

LIBRARY_DIR = "."
BOOKS_DIR = os.path.join(LIBRARY_DIR, "src", "content", "books")

def slugify(text):
    text = text.lower()
    text = re.sub(r'[^a-z0-9]+', '-', text)
    return text.strip('-')

def extract_pdf_text(pdf_path):
    try:
        reader = PdfReader(pdf_path)
        text = ""
        for page in reader.pages:
            page_text = page.extract_text()
            if page_text:
                text += page_text + "\n"
        return text
    except Exception as e:
        print(f"Error reading PDF {pdf_path}: {e}")
        return None

def find_ai_prompt(base_name, title, all_files):
    # Try to find a matching AI prompt
    # base_name is like 'book_Mike_Cohn_ 2005 _Agile_Estimating_and_Planning'
    # We want to match 'AI_Assistant_Prompt_Mike_Cohn__2005__Agile_Estimating_and_Planning_by_ciandt_EN.md'
    clean_base = re.sub(r'^book_', '', base_name)
    slug_base = slugify(clean_base)
    slug_title = slugify(title)
    
    for f in all_files:
        if f.startswith("AI_Assistant_Prompt_") and f.endswith(".md"):
            slug_f = slugify(f)
            if slug_base in slug_f or slug_title in slug_f:
                return f
    return None

def process_book(filename, all_files):
    filepath = os.path.join(LIBRARY_DIR, filename)
    base_name = filename[:-4]
    
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    
    metadata = {}
    for line in lines:
        line = re.sub(r'^\d+:\s+', '', line).strip()
        if ':' in line:
            key, val = line.split(':', 1)
            metadata[key.strip().lower()] = val.strip()
    
    if 'title' not in metadata:
        return
        
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
    
    # Content extraction
    content_body = ""
    status = "no-pdf"
    
    pdf_path = os.path.join(LIBRARY_DIR, base_name + ".pdf")
    if os.path.exists(pdf_path):
        print(f"Extracting PDF for {title}...")
        pdf_text = extract_pdf_text(pdf_path)
        if pdf_text is not None:
            content_body = pdf_text
            status = "ok"
    else:
        prompt_file = find_ai_prompt(base_name, title, all_files)
        if prompt_file:
            print(f"Injecting AI prompt for {title}...")
            with open(os.path.join(LIBRARY_DIR, prompt_file), "r", encoding="utf-8") as pf:
                content_body = pf.read()
                status = "ok"
    
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
        f.write(f"status: {status}\n")
        if link:
            f.write("links:\n")
            f.write(f"  external: {link}\n")
        f.write("---\n")
        
        if content_body:
            f.write("\n" + content_body + "\n")
        
    print(f"Migrated {title} -> src/content/books/{slug}/index.md")

def main():
    if not os.path.exists(BOOKS_DIR):
        os.makedirs(BOOKS_DIR)

    # Ensure books/index.md exists
    with open(os.path.join(BOOKS_DIR, "index.md"), "w") as f:
        f.write("---\ntype: Bundle\ntitle: All Books\n---\n# Library\n")

    all_files = os.listdir(LIBRARY_DIR)

    for filename in all_files:
        if filename.startswith("book_") and filename.endswith(".txt"):
            process_book(filename, all_files)

    print("Migration complete!")

if __name__ == "__main__":
    main()
