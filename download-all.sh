#!/bin/bash
# YOLO MODE — Download all the classics
set -e
BOOKS_DIR="/Users/danielvm/Developer/big-library/books"
PAPERS_DIR="/Users/danielvm/Developer/big-library/papers"
mkdir -p "$PAPERS_DIR"

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]+/-/g; s/^-//; s/-$//'
}

download_pdf() {
  local url="$1"
  local path="$2"
  if [ -f "$path" ]; then
    echo "  ✅ Already exists: $(basename "$path")"
    return 0
  fi
  echo "  ⬇️  Downloading: $(basename "$path")"
  if curl -sL --connect-timeout 15 --max-time 120 "$url" -o "$path"; then
    local size
    size=$(wc -c < "$path")
    if [ "$size" -gt 1000 ]; then
      echo "  ✅ Done ($((size/1024)) KB)"
      return 0
    else
      echo "  ⚠️  File too small ($size bytes), removing"
      rm -f "$path"
      return 1
    fi
  else
    echo "  ❌ Failed"
    rm -f "$path" 2>/dev/null
    return 1
  fi
}

write_index() {
  local dir="$1"
  local title="$2"
  local authors="$3"
  local year="$4"
  local publisher="$5"
  local tags="$6"
  local filename="$7"
  mkdir -p "$dir"
  if [ ! -f "$dir/index.md" ]; then
    cat > "$dir/index.md" << EOF
---
type: Book
title: "$title"
authors: [$authors]
year: $year
publisher: "$publisher"
tags: [$tags]
status: pdf
file: $filename
---
EOF
    echo "  📝 Created index.md for: $title"
  else
    echo "  📝 index.md exists for: $title"
  fi
}

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     📚 YOLO DOWNLOAD — Software Engineering Canon          ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# ====================================================================
# PHASE 1: PAPERS (new directory outside books/)
# ====================================================================
echo "───── PHASE 1: Papers ─────"

# 1. Parnas — On the Criteria
D="$PAPERS_DIR/parnas-on-the-criteria"
write_index "$D" "On the Criteria to Be Used in Decomposing Systems into Modules" '"David Parnas"' 1972 "ACM" '"modularity","software architecture","information hiding"' "parnas-1972-criteria.pdf"
download_pdf "https://prl.khoury.northeastern.edu/img/p-tr-1971.pdf" "$D/parnas-1972-criteria.pdf"

# 2. Brooks — No Silver Bullet
D="$PAPERS_DIR/brooks-no-silver-bullet"
write_index "$D" "No Silver Bullet: Essence and Accidents of Software Engineering" '"Fred Brooks"' 1986 "IEEE Computer" '"software engineering","complexity","project management"' "brooks-1986-no-silver-bullet.pdf"
download_pdf "https://www.cs.unc.edu/techreports/86-020.pdf" "$D/brooks-1986-no-silver-bullet.pdf"

# 3. Dijkstra — Go To Considered Harmful
D="$PAPERS_DIR/dijkstra-goto-considered-harmful"
write_index "$D" "Go To Statement Considered Harmful" '"Edsger Dijkstra"' 1968 "ACM" '"structured programming","control flow"' "dijkstra-1968-goto-harmful.pdf"
download_pdf "https://www.cs.utexas.edu/~EWD/ewd02xx/EWD215.PDF" "$D/dijkstra-1968-goto-harmful.pdf"

# 4. Hoare — CSP
D="$PAPERS_DIR/hoare-communicating-sequential-processes"
write_index "$D" "Communicating Sequential Processes" '"C.A.R. Hoare"' 1978 "ACM" '"concurrency","parallel computing","process algebra"' "hoare-1978-csp.pdf"
download_pdf "https://www.cs.virginia.edu/crab/hoare1978csp.pdf" "$D/hoare-1978-csp.pdf"

# 5. Conway — How Do Committees Invent
D="$PAPERS_DIR/conway-how-do-committees-invent"
write_index "$D" "How Do Committees Invent?" '"Melvin Conway"' 1968 "Datamation" '"conways law","organizational design","system design"' "conway-1968-committees-invent.pdf"
download_pdf "https://www.melconway.com/Home/pdf/committees.pdf" "$D/conway-1968-committees-invent.pdf"

# 6. Meyer — Design by Contract chapter
D="$PAPERS_DIR/meyer-design-by-contract"
write_index "$D" "Design by Contract" '"Bertrand Meyer"' 1992 "IEEE Computer" '"design by contract","software correctness","assertions"' "meyer-1992-dbc.pdf"
download_pdf "https://se.inf.ethz.ch/~meyer/publications/old/dbc_chapter.pdf" "$D/meyer-1992-dbc.pdf"

# 7. Fowler — Continuous Integration
D="$PAPERS_DIR/fowler-continuous-integration"
write_index "$D" "Continuous Integration" '"Martin Fowler"' 2006 "martinfowler.com" '"ci","continuous integration","automation"' "index.md" # HTML article, save as text reference
echo "  🌐 HTML article — saved as reference"
if [ ! -f "$D/article.html" ]; then
  curl -sL "https://martinfowler.com/articles/originalContinuousIntegration.html" -o "$D/article.html"
  echo "  ✅ Article HTML saved"
fi

# 8. Agile Manifesto
D="$PAPERS_DIR/agile-manifesto"
write_index "$D" "Manifesto for Agile Software Development" '"Kent Beck","Mike Beedle","Arie van Bennekum","Alistair Cockburn","Ward Cunningham","Martin Fowler","others"' 2001 "Agile Alliance" '"agile","manifesto","software process"' "index.md" # Web page
if [ ! -f "$D/manifesto.html" ]; then
  curl -sL "https://agilemanifesto.org/" -o "$D/manifesto.html"
  echo "  ✅ Manifesto HTML saved"
fi

# 9. Driessen — Git Branching Model
D="$PAPERS_DIR/driessen-git-branching-model"
write_index "$D" "A Successful Git Branching Model" '"Vincent Driessen"' 2010 "nvie.com" '"git","branching","version control"' "index.md"
if [ ! -f "$D/article.html" ]; then
  curl -sL "https://nvie.com/posts/a-successful-git-branching-model/" -o "$D/article.html"
  echo "  ✅ Article HTML saved"
fi

# 10. Czarnecki — Components & Generative Programming
D="$PAPERS_DIR/czarnecki-components-generative-programming"
write_index "$D" "Components and Generative Programming" '"Krzysztof Czarnecki","Ulrich Eisenecker"' 1999 "ESEC/FSE" '"generative programming","software product lines","components"' "czarnecki-1999-generative.pdf"
download_pdf "https://gsd.uwaterloo.ca/sites/default/files/esec99.pdf" "$D/czarnecki-1999-generative.pdf"

# 11. Völter — Program Generation
D="$PAPERS_DIR/volter-program-generation"
write_index "$D" "Program Generation" '"Markus Völter"' 2003 "voelter.de" '"code generation","model-driven","templates"' "volter-2003-program-generation.pdf"
download_pdf "https://www.voelter.de/data/pub/ProgramGeneration.pdf" "$D/volter-2003-program-generation.pdf"

# 12. Scrum Guide
D="$PAPERS_DIR/scrum-guide"
write_index "$D" "The Scrum Guide" '"Ken Schwaber","Jeff Sutherland"' 2020 "scrumguides.org" '"scrum","agile","process framework"' "index.md"
if [ ! -f "$D/scrum-guide.html" ]; then
  curl -sL "https://scrumguides.org/scrum-guide.html" -o "$D/scrum-guide.html"
  echo "  ✅ Scrum Guide HTML saved"
fi

# 13. Cathedral and the Bazaar
D="$PAPERS_DIR/raymond-cathedral-bazaar"
write_index "$D" "The Cathedral and the Bazaar" '"Eric S. Raymond"' 1999 "O'Reilly" '"open source","software development","bazaar model"' "index.md"
if [ ! -f "$D/essay.html" ]; then
  curl -sL "http://www.catb.org/esr/writings/homesteading/cathedral-bazaar/index.html" -o "$D/essay.html"
  echo "  ✅ Essay HTML saved"
fi

# 14. Writing the Agile Manifesto (Fowler)
D="$PAPERS_DIR/fowler-writing-agile-manifesto"
write_index "$D" "Writing the Agile Manifesto" '"Martin Fowler"' 2006 "martinfowler.com" '"agile","manifesto","history"' "index.md"
if [ ! -f "$D/article.html" ]; then
  curl -sL "https://martinfowler.com/articles/agileStory.html" -o "$D/article.html"
  echo "  ✅ Article HTML saved"
fi

# 15. Ousterhout — Philosophy of Software Design
D="$PAPERS_DIR/ousterhout-philosophy-of-software-design"
write_index "$D" "A Philosophy of Software Design" '"John Ousterhout"' 2018 "Stanford" '"software design","complexity","abstraction"' "index.md"
echo "  🌐 Author's site — free download at https://stanford.edu/~ouster/cgi-bin/aposd.php"

echo ""
echo "───── Phase 1 done ─────"
echo ""

# ====================================================================
# PHASE 2: NEW BOOKS (not yet in your library)
# ====================================================================
echo "───── PHASE 2: New Books ─────"

# 1. The Mythical Man-Month
D="$BOOKS_DIR/the-mythical-man-month"
write_index "$D" "The Mythical Man-Month: Essays on Software Engineering" '"Fred Brooks"' 1975 "Addison-Wesley" '"software engineering","project management","brooks law"' "mythical-man-month.pdf"
download_pdf "https://archive.org/download/MythicalManMonth/MythicalManMonth.pdf" "$D/mythical-man-month.pdf"

# 2. Extreme Programming Explained
D="$BOOKS_DIR/extreme-programming-explained"
write_index "$D" "Extreme Programming Explained: Embrace Change" '"Kent Beck"' 2000 "Addison-Wesley" '"xp","extreme programming","agile","tdd"' "xp-explained.pdf"
download_pdf "https://archive.org/download/extremeprogrammi00beck/extremeprogrammi00beck.pdf" "$D/xp-explained.pdf"

# 3. The Practice of Programming
D="$BOOKS_DIR/the-practice-of-programming"
write_index "$D" "The Practice of Programming" '"Brian Kernighan","Rob Pike"' 1999 "Addison-Wesley" '"programming","style","debugging","testing"' "practice-of-programming.pdf"
download_pdf "https://archive.org/download/practiceofprogra0000kern/practiceofprogra0000kern.pdf" "$D/practice-of-programming.pdf"

# 4. The Unix Programming Environment
D="$BOOKS_DIR/the-unix-programming-environment"
write_index "$D" "The Unix Programming Environment" '"Brian Kernighan","Rob Pike"' 1984 "Prentice-Hall" '"unix","software tools","shell","pipelines"' "unix-programming-environment.pdf"
download_pdf "https://archive.org/download/unixprogramminge0000kern/unixprogramminge0000kern.pdf" "$D/unix-programming-environment.pdf"

# 5. Software Tools
D="$BOOKS_DIR/software-tools"
write_index "$D" "Software Tools" '"Brian Kernighan","P.J. Plauger"' 1976 "Addison-Wesley" '"software tools","modularity","programming"' "software-tools.pdf"
download_pdf "https://archive.org/download/softwaretools00kern/softwaretools00kern.pdf" "$D/software-tools.pdf"

# 6. Test-Driven Development by Example
D="$BOOKS_DIR/test-driven-development-by-example"
write_index "$D" "Test-Driven Development by Example" '"Kent Beck"' 2002 "Addison-Wesley" '"tdd","testing","agile","refactoring"' "tdd-by-example.pdf"
download_pdf "https://archive.org/download/testdrivendevelo0000beck/testdrivendevelo0000beck.pdf" "$D/tdd-by-example.pdf"

# 7. Code Complete
D="$BOOKS_DIR/code-complete"
write_index "$D" "Code Complete" '"Steve McConnell"' 2004 "Microsoft Press" '"software construction","best practices","coding"' "code-complete.pdf"
download_pdf "https://archive.org/download/codecomplete0000mcco/codecomplete0000mcco.pdf" "$D/code-complete.pdf"

# 8. SICP
D="$BOOKS_DIR/structure-and-interpretation-of-computer-programs"
write_index "$D" "Structure and Interpretation of Computer Programs" '"Harold Abelson","Gerald Jay Sussman","Julie Sussman"' 1985 "MIT Press" '"programming","lisp","abstraction","metalinguistic"' "sicp.pdf"
download_pdf "https://web.mit.edu/6.001/6.037/sicp.pdf" "$D/sicp.pdf"

# 9. Agile Estimating and Planning
D="$BOOKS_DIR/agile-estimating-and-planning"
write_index "$D" "Agile Estimating and Planning" '"Mike Cohn"' 2005 "Prentice-Hall" '"agile","estimation","planning","story points"' "agile-estimating-planning.pdf"
download_pdf "https://www.stat.cmu.edu/~brian/nynke/726-2021/612%20materials/36-612_Agile%20Estimating%20and%20Planning%20by%20Mike%20Cohn.pdf" "$D/agile-estimating-planning.pdf"

# 10. User Stories Applied
D="$BOOKS_DIR/user-stories-applied"
write_index "$D" "User Stories Applied: For Agile Software Development" '"Mike Cohn"' 2004 "Addison-Wesley" '"user stories","agile","requirements"' "user-stories-applied.pdf"
download_pdf "https://www.mountaingoatsoftware.com/uploads/articles/User-Stories-Applied-Mike-Cohn.pdf" "$D/user-stories-applied.pdf"

# 11. Agile Retrospectives
D="$BOOKS_DIR/agile-retrospectives"
write_index "$D" "Agile Retrospectives: Making Good Teams Great" '"Esther Derby","Diana Larsen"' 2006 "Pragmatic Bookshelf" '"retrospectives","agile","continuous improvement"' "agile-retrospectives.pdf"
download_pdf "https://archive.org/download/agileretrospecti0000derb/agileretrospecti0000derb.pdf" "$D/agile-retrospectives.pdf"

# 12. Lean Software Development: An Agile Toolkit
D="$BOOKS_DIR/lean-software-development-agile-toolkit"
write_index "$D" "Lean Software Development: An Agile Toolkit" '"Mary Poppendieck","Tom Poppendieck"' 2003 "Addison-Wesley" '"lean","agile","software development","toolkit"' "lean-software-dev-toolkit.pdf"
download_pdf "https://archive.org/download/leansoftwaredeve0000mary/leansoftwaredeve0000mary.pdf" "$D/lean-software-dev-toolkit.pdf"

# 13. Crystal Clear
D="$BOOKS_DIR/crystal-clear"
write_index "$D" "Crystal Clear: A Human-Powered Methodology for Small Teams" '"Alistair Cockburn"' 2005 "Addison-Wesley" '"crystal","agile","methodology","small teams"' "crystal-clear.pdf"
download_pdf "https://archive.org/download/crystalclearhuma00cock_0/crystalclearhuma00cock_0.pdf" "$D/crystal-clear.pdf"

# 14. Kanban (Blue Book)
D="$BOOKS_DIR/kanban-successful-evolutionary-change"
write_index "$D" "Kanban: Successful Evolutionary Change for Your Technology Business" '"David J. Anderson"' 2010 "Blue Hole Press" '"kanban","lean","wip","flow"' "kanban-blue-book.pdf"
download_pdf "https://img1.wsimg.com/blobby/go/b7728943-bef2-4e66-8058-ebe0b3999a7c/downloads/Blue%20Book%20Kanban-eng.pdf" "$D/kanban-blue-book.pdf"

# 15. The Lean Startup
D="$BOOKS_DIR/the-lean-startup"
write_index "$D" "The Lean Startup" '"Eric Ries"' 2011 "Crown Business" '"lean startup","mvp","validated learning","innovation"' "lean-startup.pdf"
download_pdf "https://archive.org/download/TheLeanStartupErickRies/TheLeanStartupErickRies.pdf" "$D/lean-startup.pdf"

# 16. Peopleware
D="$BOOKS_DIR/peopleware-productive-projects-and-teams"
write_index "$D" "Peopleware: Productive Projects and Teams" '"Tom DeMarco","Tim Lister"' 1987 "Dorset House" '"team","management","productivity","human factors"' "peopleware.pdf"
download_pdf "https://archive.org/download/peoplewareproduc00dema_0/peoplewareproduc00dema_0.pdf" "$D/peopleware.pdf"

# 17. Object-Oriented Software Construction (Meyer)
D="$BOOKS_DIR/object-oriented-software-construction"
write_index "$D" "Object-Oriented Software Construction" '"Bertrand Meyer"' 1997 "Prentice-Hall" '"oop","design by contract","eiffel","software engineering"' "oosc.pdf"
echo "  🌐 Author-authorized free PDF at https://bertrandmeyer.com/oosc2/ — download manually (multi-part) or check for single PDF"

# 18. The Cathedral and the Bazaar (book version)
D="$BOOKS_DIR/the-cathedral-and-the-bazaar"
write_index "$D" "The Cathedral and the Bazaar" '"Eric S. Raymond"' 1999 "O'Reilly" '"open source","bazaar","software development"' "index.md"
echo "  🌐 Full text at http://www.catb.org/esr/writings/cathedral-bazaar/ — saved as HTML in papers/"

echo ""
echo "───── Phase 2 done ─────"
echo ""

# ====================================================================
# PHASE 3: UPDATE EXISTING BOOKS in your library with PDFs
# ====================================================================
echo "───── PHASE 3: Update existing library books ─────"

# Lean Thinking
update_book_pdf() {
  local dir="$1"
  local url="$2"
  local filename="$3"
  if [ -d "$BOOKS_DIR/$dir" ]; then
    echo "  📖 Updating: $dir"
    download_pdf "$url" "$BOOKS_DIR/$dir/$filename"
    # Update index.md to change status from no-pdf to pdf
    if grep -q "status: no-pdf" "$BOOKS_DIR/$dir/index.md" 2>/dev/null; then
      # Add file field and update status
      sed -i '' 's/status: no-pdf/status: pdf/' "$BOOKS_DIR/$dir/index.md"
      if ! grep -q "file:" "$BOOKS_DIR/$dir/index.md" 2>/dev/null; then
        # Insert file field before tags or at end of frontmatter
        sed -i '' '/^tags:/a\'$'\n''file: '"$filename" "$BOOKS_DIR/$dir/index.md"
      fi
      echo "     ✅ Updated status to pdf"
    fi
  else
    echo "  ⚠️  Directory not found: $dir"
  fi
}

update_book_pdf "lean-thinking-banish-waste-and-create-wealth-in-your-corporation" \
  "https://archive.org/download/leanthinkingbani0000woma/leanthinkingbani0000woma.pdf" \
  "lean-thinking.pdf"

update_book_pdf "the-machine-that-changed-the-world-the-story-of-lean-production" \
  "https://archive.org/download/machinethatchang0000woma/machinethatchang0000woma.pdf" \
  "machine-that-changed-the-world.pdf"

update_book_pdf "learning-to-see-value-stream-mapping-to-add-value-and-eliminate-muda" \
  "https://archive.org/download/learningtoseeval0000roth/learningtoseeval0000roth.pdf" \
  "learning-to-see.pdf"

update_book_pdf "managing-to-learn-using-the-a3-management-process-to-solve-problems-gain-agreement-mentor-and-lead" \
  "https://archive.org/download/managingtolearnu0000shoo/managingtolearnu0000shoo.pdf" \
  "managing-to-learn.pdf"

echo ""
echo "───── Phase 3 done ─────"
echo ""

# ====================================================================
# SUMMARY
# ====================================================================
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     📊 DOWNLOAD SUMMARY                                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Papers directory: $PAPERS_DIR"
echo "Books directory: $BOOKS_DIR"
echo ""

# Count PDFs
echo "PDFs downloaded:"
find "$PAPERS_DIR" "$BOOKS_DIR" -name "*.pdf" -type f 2>/dev/null | while read f; do
  size=$(wc -c < "$f" | tr -d ' ')
  echo "  ✅ $(basename "$f") ($((size/1024)) KB)"
done
echo ""

# Manual ones
echo "Manual downloads needed (no direct PDF URL):"
echo "  📕 A Philosophy of Software Design — https://stanford.edu/~ouster/cgi-bin/aposd.php"
echo "  📕 Object-Oriented Software Construction — https://bertrandmeyer.com/oosc2/"
echo "  📕 Generative Programming (Czarnecki) — publisher only"
echo ""
echo "Already in library (no IA PDF found):"
echo "  📖 Daily Management to Execute Strategy"
echo "  📖 Design a Better Business"
echo "  📖 Fast/Forward"
echo "  📖 Faster, Faster"
echo "  📖 Getting the Right Things Done"
echo "  📖 Managing on Purpose"
echo "  📖 The Lean Turnaround"
echo "  📖 The Toyota Way"
echo "  📖 Value Stream Mapping"
echo "  📖 The Phoenix Project"
echo "  📖 Implementing Lean Software Development"
echo ""
echo "🎯 DONE!"
