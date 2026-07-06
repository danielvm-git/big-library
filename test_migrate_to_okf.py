import unittest
import os
import shutil
import tempfile
import sys
import pypdf

class TestMigrateToOkf(unittest.TestCase):
    def setUp(self):
        self.test_dir = tempfile.mkdtemp()
        self.books_dir = os.path.join(self.test_dir, "src", "content", "books")
        
        # Override the constants in the script
        import migrate_to_okf
        self.old_library_dir = migrate_to_okf.LIBRARY_DIR
        self.old_books_dir = migrate_to_okf.BOOKS_DIR
        migrate_to_okf.LIBRARY_DIR = self.test_dir
        migrate_to_okf.BOOKS_DIR = self.books_dir

    def tearDown(self):
        import migrate_to_okf
        migrate_to_okf.LIBRARY_DIR = self.old_library_dir
        migrate_to_okf.BOOKS_DIR = self.old_books_dir
        shutil.rmtree(self.test_dir)

    def test_pdf_extraction_and_status(self):
        # Create a fake metadata txt
        with open(os.path.join(self.test_dir, "book_test.txt"), "w") as f:
            f.write("title: Test Book PDF\n")
        
        # Create a fake PDF
        from pypdf import PdfWriter
        writer = PdfWriter()
        writer.add_blank_page(width=100, height=100)
        with open(os.path.join(self.test_dir, "book_test.pdf"), "wb") as f:
            writer.write(f)
            
        import migrate_to_okf
        migrate_to_okf.main()
        
        index_path = os.path.join(self.books_dir, "test-book-pdf", "index.md")
        self.assertTrue(os.path.exists(index_path))
        
        with open(index_path, "r") as f:
            content = f.read()
            
        self.assertIn("status: ok", content)
        self.assertNotIn("status: no-pdf", content)
        
    def test_ai_prompt_extraction_and_status(self):
        # Create a fake metadata txt
        with open(os.path.join(self.test_dir, "book_prompt.txt"), "w") as f:
            f.write("title: Test Prompt Book\n")
            
        # Create a fake AI prompt md file
        with open(os.path.join(self.test_dir, "AI_Assistant_Prompt_Test_Prompt_Book.md"), "w") as f:
            f.write("This is AI prompt extracted content.\n")
            
        import migrate_to_okf
        migrate_to_okf.main()
        
        index_path = os.path.join(self.books_dir, "test-prompt-book", "index.md")
        self.assertTrue(os.path.exists(index_path))
        
        with open(index_path, "r") as f:
            content = f.read()
            
        self.assertIn("status: ok", content)
        self.assertNotIn("status: no-pdf", content)
        self.assertIn("This is AI prompt extracted content.", content)

if __name__ == '__main__':
    unittest.main()
