# File Filters — Wiki Page Evaluation

> **For the wiki agent.** This document evaluates `fileFilters.md` and tells you exactly what
> to add or improve. All content is described in full — you do not need to read the app source
> code. Do NOT publish this file as a wiki page.

---

## 1. Current State of `fileFilters.md`

The page exists (223 lines, permalink `fileFilters.html`). The site is Jekyll + kramdown.

### Sections already present — do not rewrite unless noted

| Section | Status |
|---|---|
| Opening File Filters | OK — references `toolbar.png` (generic; see screenshot gap §4) |
| How Filters Work (Any/All, +/− buttons, rule structure) | OK — add Any/All example from §3b |
| Name Filters — table with 6 comparators | OK — add "is like" examples from §3a |
| Path Filters — table with 3 comparators, path example, Exclude mention | OK — add Exclude screenshot from §4, clarify where to right-click (§2e) |
| File Size Filters | **INCOMPLETE** — missing comparator table, add content from §2a |
| File Modification Date Filters — table with 4 comparators | OK |
| Managing Filter Sets — ⊙ menu with 5 actions | OK — add session-vs-global note from §2d |
| Folder Traversal | OK — add performance example from §3c |

### Screenshots already in `img/screenshots/folder/fileFilters/`

| File | Shows |
|---|---|
| `main.png` | Filter panel with active rules and logic operator |
| `options.png` | Category dropdown (Name, Name Ignore Case, Path, Path Ignore Case, File Size, File Modification Date) |
| `nameOptions.png` | Name comparators (contains, begins with, ends with, is, is not, is like) |
| `pathOptions.png` | Path comparators (contains, is, ends with) |
| `fileSizeOptions.png` | File size filter UI with size unit selector |
| `fileDateOperators.png` | Date comparators (exactly, is not, before, after) |
| `contextMenu.png` | ⊙ management menu (Fill with Defaults, Set Current as Defaults, Restore Factory Defaults, Copy to Clipboard, Paste from Clipboard) |
| `traverseFileFilters.png` | Folder traversal option in Comparison tab |

---

## 2. Missing Sections — add this content

### 2a. File Size comparator table — HIGH PRIORITY

The current wiki text for File Size only says:
> "Specify the size value and select the unit (Bytes, KB, MB, GB)."

The app supports four comparators for File Size. Add a table identical in style to the other
categories, placed between the `fileSizeOptions.png` image and the next section:

| Comparator | Description |
|---|---|
| is | File size equals the specified value |
| is not | File size does not equal the specified value |
| is less than | File size is smaller than the specified value |
| is greater than | File size is larger than the specified value |

The existing screenshot `fileSizeOptions.png` already shows the file size UI; no new screenshot
is needed for this section.

### 2b. Default Filters — HIGH PRIORITY

The page never tells the user what the factory defaults are. Add a callout or short paragraph
(suggested placement: inside the "How Filters Work" section or as its own short section
immediately after it).

**Before adding this**, check `_includes/displayFiles.md` — it already lists the default
filters. If that include is already rendered on a page accessible from fileFilters.md, add a
cross-link instead of duplicating. If not, use the following content:

---

The factory default filters exclude version control directories and common system junk files:

| Excluded item | Rule used |
|---|---|
| `.DS_Store` | Name is `.DS_Store` |
| `*~` (backup files) | Name is like `*~` |
| `CVS` | Name is like `CVS` |
| `.svn` | Name is like `.svn` |
| `.git` | Name is like `.git` |
| `.hg` | Name is like `.hg` |
| `.bzr` | Name is like `.bzr` |

These are combined with `Any` (logical OR), so a file or folder is excluded if its name matches
any one of these rules.

---

### 2c. Show Filtered Files — HIGH PRIORITY

The page says nothing about what happens visually to filtered items or how to toggle their
visibility. Add a new section after Filter Categories and before Managing Filter Sets.

**Suggested section title:** `Show Filtered Files`

**Content to add:**

---

By default, files and folders that match the active filters are hidden from the folder
comparison view. You can make them visible without removing the filters:

- **Via the View menu** — choose **Show Filtered Files** to display them. The menu item
  toggles to **Hide Filtered Files** when they are visible.
- **Via the scope bar** — the **Filtered** segment at the right end of the scope bar shows or
  hides filtered items without opening any menu.

When filtered items are shown, they appear with a distinct visual style (greyed out) so you
can tell them apart from normal comparison results.

> Filtered files are skipped during copy and delete operations even when they are visible.
> To include them, select **Show Filtered Files** from the View menu.

---

Use the new screenshot `scopeBarFiltered.png` (see §4) to illustrate the scope bar with the
Filtered segment visible. Optionally add `filteredInView.png` showing the greyed-out items
in the folder view.

### 2d. Session filters vs. global defaults — MEDIUM PRIORITY

The opening paragraph already states:
> "Filters are defined globally and apply to all sessions; each session can override them
> with its own set."

But the mechanism is never explained. Add a short note (as a callout or a sentence block)
in the Managing Filter Sets section, after the action table:

---

**How session filters and global defaults relate:**

Each open session keeps its own copy of the filter rules. Changes you make in the Session
Preferences dialog affect only the current session. The ⊙ menu lets you synchronise
between the session and the application-wide default:

- **Set Current as Defaults** — saves the current session's filters as the new global
  default, applied to every future new session.
- **Fill with Defaults** — replaces the current session's filters with the global default,
  discarding any local changes.
- **Restore Factory Defaults** — clears the global default and reverts to the original
  factory filters (see Default Filters section).

---

### 2e. Context menu "Exclude" — MEDIUM PRIORITY

The Path Filters section already mentions the Exclude menu item but does not say where to
find it. Replace or expand the existing sentence:

> "The context menu item **Exclude** automatically adds a path filter for the selected folder."

With:

> Right-click any file or folder in the **folder comparison view** and choose **Exclude** from
> the context menu. VisualDiffer automatically adds a `Path ends with <relative-path>` rule
> for the selected item to the current session's filters.

Add the screenshot `contextMenuExclude.png` (see §4) immediately after this text.

---

## 3. Advanced Features That Need Clarifying Examples

### 3a. "is like" — wildcard patterns — ADVANCED, ADD EXAMPLES

The current text only says:
> "`?` matches exactly one character and `*` matches zero or more characters"

No examples are given. Add an example block immediately after that sentence, inside the Name
Filters section:

---

`is like` uses **glob-style** patterns, not regular expressions. The `.` character has no
special meaning — it matches a literal dot.

| Pattern | Matches | Does NOT match |
|---|---|---|
| `*.tmp` | `build.tmp`, `cache.tmp` | `notes.txt` |
| `test_??.swift` | `test_01.swift`, `test_ab.swift` | `test_1.swift` (only one character after `_`) |
| `.*` | `.DS_Store`, `.gitignore`, `.env` | `readme.md` |
| `backup*` | `backup.zip`, `backup_2024.tar.gz` | `mybackup.zip` (does not start with `backup`) |

To match hidden files on macOS (names starting with a dot), use the pattern `.*` with
**Name (Ignore Case) is like**.

---

### 3b. Any vs. All — compound rules — ADVANCED, ADD EXAMPLE

The Any/All distinction is non-obvious when mixing different filter categories. Add a concrete
example to the "How Filters Work" section, after the existing Any/All description:

---

**Example — exclude only large log files**

*Goal:* exclude files that are *both* named `*.log` *and* larger than 10 MB.  
You do not want to exclude all `.log` files, and you do not want to exclude all large files.

Set the operator to **All**, then add two rules:

1. `Name (Ignore Case)` **is like** `*.log`
2. `File Size` **is greater than** `10` MB

With **All**, a file must satisfy *every* rule to be excluded. Only `.log` files larger than
10 MB are filtered out.

If you used **Any**, the filter would exclude *any* file whose name ends in `.log` *plus*
*any* file larger than 10 MB — a much broader exclusion.

---

### 3c. Path filter + Folder Traversal — performance use case — ADVANCED, ADD EXAMPLE

The Folder Traversal section explains the toggle but not *when* to use it. Expand the section
with a practical scenario after the existing explanation:

---

**Example — completely skip build output directories**

If your project has large `build/` or `DerivedData/` folders you never need to compare,
you can exclude them *and* skip reading their contents entirely:

1. Open the Session Preferences **File Filters** tab.
2. Add a rule: `Name` **is** `build`  
   (add a second rule `Name is DerivedData` if needed, with operator set to **Any**)
3. Switch to the **Comparison** tab.
4. **Disable** the option **Traverse the folders that match the 'File Filters'**.

With traversal disabled, VisualDiffer does not read the contents of matching folders at all.
The scan is significantly faster on large trees.

With traversal **enabled** (the default), filtered folders are hidden from the view but
their contents are still read. This is useful when you want to hide a folder from the
comparison results but still allow copy or delete actions on files inside it.

---

## 4. Screenshots to Take

| Filename (suggested) | Section to use it in | What the screenshot must show |
|---|---|---|
| `toolbarFilterButton.png` | Opening File Filters | The folder comparison toolbar zoomed in on the filter icon button, with the button clearly visible. The current `toolbar.png` is a wide shot of the full toolbar and the filter button is hard to identify. Either replace it or add a focused crop. |
| `scopeBarFiltered.png` | Show Filtered Files (new §2c) | The scope bar at the bottom of the folder comparison window. The **Filtered** segment on the right end of the bar must be visible. Ideal state: some files are filtered, so the segment is active/highlighted. |
| `filteredInView.png` | Show Filtered Files (new §2c) — optional | The folder comparison view with Show Filtered Files active. Filtered items should be visible in the list with their greyed-out appearance, alongside normal (non-filtered) items so the contrast is clear. |
| `contextMenuExclude.png` | Path Filters (§2e) | Right-click context menu open on a folder or file in the folder comparison view. The **Exclude** menu item must be visible in the menu. |

---

## 5. Cross-reference Checklist

Before publishing changes, verify these related pages to avoid duplication:

- [ ] `_includes/displayFiles.md` — already lists the default filters (.DS_Store, .git, etc.).
  Read it. If that include is already rendered in a publicly visible page, use a Jekyll include
  or a link from the Default Filters section instead of copy-pasting the list.
- [ ] `preferences/folder.md` — check if the Folder Traversal option is documented there.
  If yes, add a cross-link in the Folder Traversal section of fileFilters.md rather than
  duplicating the explanation.
- [ ] `preferences/confirmations.md` — contains "Include Filtered Items By Default"
  (the preference that controls whether filtered files are included in copy/delete by default).
  The new Show Filtered Files section should mention this preference and link to that page.
- [ ] `colorsLegend.md` line 54 — references filtered folders in the color legend. After adding
  the Show Filtered Files section, add a cross-link from colorsLegend.md to that new anchor.
- [ ] `index.md` — the Table of Contents already links to File Filters. No change needed unless
  you add sub-anchors you want to surface at the top level.

---

## 6. Suggested Final Page Structure

```
File Filters
│
├── Opening File Filters              existing — OK (consider replacing toolbar.png)
├── How Filters Work                  existing — add Any/All example (§3b)
├── Default Filters                   NEW (§2b) — or reuse include from _includes/displayFiles.md
├── Filter Categories
│   ├── Name Filters                  existing — add "is like" examples (§3a)
│   ├── Path Filters                  existing — add Exclude screenshot + clarify right-click (§2e)
│   ├── File Size Filters             existing — add comparator table (§2a)
│   └── File Modification Date        existing — OK
├── Show Filtered Files               NEW (§2c) — needs scopeBarFiltered.png
├── Managing Filter Sets              existing — add session-vs-global note (§2d)
└── Folder Traversal                  existing — add Path+Traversal example (§3c)
```

Total new screenshots needed: 2 required (`scopeBarFiltered.png`, `contextMenuExclude.png`),
2 optional (`toolbarFilterButton.png` crop, `filteredInView.png`).
