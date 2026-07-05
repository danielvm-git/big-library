import os
import glob

books_dir = "/Users/danielvm/Developer/big-library/books"
index_files = glob.glob(os.path.join(books_dir, "*", "index.md"))

for filepath in index_files:
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if "diataxis:" not in content:
        # Insert diataxis: reference after type: Book
        content = content.replace("type: Book\n", "type: Book\ndiataxis: reference\n")
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Updated {os.path.basename(os.path.dirname(filepath))}/index.md")
    else:
        print(f"Already updated {os.path.basename(os.path.dirname(filepath))}/index.md")
