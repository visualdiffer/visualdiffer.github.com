---
permalink: fileFilters.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: fileFilters
title: File Filters
subtitle: Filters can be used to exclude files from comparison, copy and delete actions
---

File filters let you exclude files and folders from comparison, copy and delete actions. Filters are defined globally and apply to all sessions; each session can override them with its own set.

# [Opening File Filters](#opening_file_filters)

Click the filter icon in the folder view toolbar to open the Session Preferences dialog on the **File Filters** tab.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/toolbar.png){:.wiki-img}

# [How Filters Work](#how_filters_work)

The panel shows the list of active rules and a logic operator that controls how they are combined.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/main.png){:.wiki-img}

- **Any** — a file is excluded if *at least one* rule matches (logical OR)
- **All** — a file is excluded only if *all* rules match (logical AND)

Use the **+** button at the end of a rule row to add a new rule below it, and the **−** button to remove it.

**Example — exclude only large log files**

*Goal:* exclude files that are *both* named `*.log` *and* larger than 10 MB.
You do not want to exclude all `.log` files, and you do not want to exclude all large files.

Set the operator to **All**, then add two rules:

1. `Name (Ignore Case)` **is like** `*.log`
2. `File Size` **is greater than** `10` MB

With **All**, a file must satisfy *every* rule to be excluded. Only `.log` files larger than 10 MB are filtered out. If you used **Any**, the filter would exclude *any* file whose name ends in `.log` *plus* *any* file larger than 10 MB — a much broader exclusion.

Each rule is made up of three parts: a **category**, a **comparator**, and a **value**.

# [Default Filters](#default_filters)

The factory-default filters exclude version control directories and common system junk files. See the [Comparison Method](comparisonMethods.html#show_filtered_files) page for the full list of excluded items (`.DS_Store`, `.git`, `.svn`, `.hg`, `.bzr`, CVS, and backup files matching `*~`).

These rules are combined with **Any** (logical OR), so a file or folder is excluded if its name matches any one of them.

# [Filter Categories](#filter_categories)

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/options.png){:.wiki-img}

## [Name Filters](#name_filters)

Available for categories **Name** (case-sensitive) and **Name (Ignore Case)** (case-insensitive).

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/nameOptions.png){:.wiki-img}

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Comparator</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>contains</td>
                <td>Filename contains the specified string</td>
            </tr>
            <tr>
                <td>begins with</td>
                <td>Filename begins with the specified string</td>
            </tr>
            <tr>
                <td>ends with</td>
                <td>Filename ends with the specified string</td>
            </tr>
            <tr>
                <td>is</td>
                <td>Filename is equal to the specified string</td>
            </tr>
            <tr>
                <td>is not</td>
                <td>Filename is not equal to the specified string</td>
            </tr>
            <tr>
                <td>is like</td>
                <td>Filename matches the specified pattern;
                    <code>?</code> matches exactly one character and <code>*</code> matches zero or more characters</td>
            </tr>
        </tbody>
    </table>
</div>

`is like` uses **glob-style** patterns, not regular expressions. The `.` character has no special meaning — it matches a literal dot.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Pattern</th>
                <th>Matches</th>
                <th>Does NOT match</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><code>*.tmp</code></td>
                <td><code>build.tmp</code>, <code>cache.tmp</code></td>
                <td><code>notes.txt</code></td>
            </tr>
            <tr>
                <td><code>test_??.swift</code></td>
                <td><code>test_01.swift</code>, <code>test_ab.swift</code></td>
                <td><code>test_1.swift</code> (only one character after <code>_</code>)</td>
            </tr>
            <tr>
                <td><code>.*</code></td>
                <td><code>.DS_Store</code>, <code>.gitignore</code>, <code>.env</code></td>
                <td><code>readme.md</code></td>
            </tr>
            <tr>
                <td><code>backup*</code></td>
                <td><code>backup.zip</code>, <code>backup_2024.tar.gz</code></td>
                <td><code>mybackup.zip</code> (does not start with <code>backup</code>)</td>
            </tr>
        </tbody>
    </table>
</div>

To match hidden files on macOS (names starting with a dot), use the pattern `.*` with **Name (Ignore Case) is like**.

## [Path Filters](#path_filters)

Available for categories **Path** (case-sensitive) and **Path (Ignore Case)** (case-insensitive).  
The value is a path relative to the comparison root.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/pathOptions.png){:.wiki-img}

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Comparator</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>contains</td>
                <td>Path contains the specified string</td>
            </tr>
            <tr>
                <td>is</td>
                <td>Path is equal to the specified string</td>
            </tr>
            <tr>
                <td>ends with</td>
                <td>Path ends with the specified string</td>
            </tr>
        </tbody>
    </table>
</div>

**Example**

Left root path: <strong>/Users/dave/sources/</strong>

<pre>
/Users/dave/sources/
&nbsp;&nbsp;project_1
&nbsp;&nbsp;&nbsp;&nbsp;src/
&nbsp;&nbsp;project_2
&nbsp;&nbsp;&nbsp;&nbsp;src/
&nbsp;&nbsp;&nbsp;&nbsp;index.txt
</pre>

To exclude only the <strong>src</strong> folder under <strong>project_1</strong>, set the path filter value to <strong>project_1/src</strong>.  
The path is relative to the root <strong>/Users/dave/sources/</strong>; both folders and files are accepted as path values.  
Right-click any file or folder in the **folder comparison view** and choose **Exclude** from the context menu. VisualDiffer automatically adds a `Path ends with <relative-path>` rule for the selected item to the current session's filters.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/contextMenuExclude.png){:.wiki-img}

Be careful not to add extra characters; the following paths will never match:  
<strong>project_1//src</strong>&nbsp;&nbsp;&nbsp;invalid, double slash  
<strong>project_1/src/</strong>&nbsp;&nbsp;&nbsp;invalid, trailing slash

## [File Size Filters](#file_size_filters)

Available for category **File Size**. Applies to files only, not folders.  
Specify the size value and select the unit (Bytes, KB, MB, GB).

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/fileSizeOptions.png){:.wiki-img}

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Comparator</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>is</td>
                <td>File size equals the specified value</td>
            </tr>
            <tr>
                <td>is not</td>
                <td>File size does not equal the specified value</td>
            </tr>
            <tr>
                <td>is less than</td>
                <td>File size is smaller than the specified value</td>
            </tr>
            <tr>
                <td>is greater than</td>
                <td>File size is larger than the specified value</td>
            </tr>
        </tbody>
    </table>
</div>

## [File Modification Date Filters](#file_modification_date_filters)

Available for category **File Modification Date**. Applies to files only, not folders.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/fileDateOperators.png){:.wiki-img}

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Comparator</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>exactly</td>
                <td>Modification date matches exactly</td>
            </tr>
            <tr>
                <td>is not</td>
                <td>Modification date does not match</td>
            </tr>
            <tr>
                <td>before</td>
                <td>Modification date is earlier than the specified date</td>
            </tr>
            <tr>
                <td>after</td>
                <td>Modification date is later than the specified date</td>
            </tr>
        </tbody>
    </table>
</div>

# [Show Filtered Files](#show_filtered_files)

By default, files and folders that match the active filters are hidden from the folder comparison view. You can make them visible without removing the filters:

- **Via the View menu** — choose **Show Filtered Files** to display them. The menu item toggles to **Hide Filtered Files** when they are visible.
- **Via the scope bar** — the **Filtered** segment at the right end of the scope bar shows or hides filtered items without opening any menu.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/scopeBarFiltered.png){:.wiki-img}

When filtered items are shown, they appear with a distinct visual style so you can tell them apart from normal comparison results, as shown in the figure below.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/filteredInView.png){:.wiki-img}

> Filtered files are skipped during copy and delete operations even when they are visible. To include them by default, enable **Include Filtered Items By Default** in [Confirmations Preferences](preferences/confirmations.html).

# [Managing Filter Sets](#managing_filter_sets)

The **⊙** button in the top-right corner of the panel opens a menu to manage filter configurations.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/contextMenu.png){:.wiki-img}

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Action</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Fill with Defaults</td>
                <td>Loads the filters saved as your personal defaults</td>
            </tr>
            <tr>
                <td>Set Current as Defaults</td>
                <td>Saves the current filter list as your personal defaults</td>
            </tr>
            <tr>
                <td>Restore Factory Defaults</td>
                <td>Resets filters to the original factory defaults</td>
            </tr>
            <tr>
                <td>Copy to Clipboard</td>
                <td>Copies the current filter configuration to the clipboard</td>
            </tr>
            <tr>
                <td>Paste from Clipboard</td>
                <td>Applies a filter configuration previously copied to the clipboard</td>
            </tr>
        </tbody>
    </table>
</div>

**How session filters and global defaults relate:**

Each open session keeps its own copy of the filter rules. Changes you make in the Session Preferences dialog affect only the current session. The ⊙ menu lets you synchronise between the session and the application-wide default:

- **Set Current as Defaults** — saves the current session's filters as the new global default, applied to every future new session.
- **Fill with Defaults** — replaces the current session's filters with the global default, discarding any local changes.
- **Restore Factory Defaults** — clears the global default and reverts to the original factory filters (see [Default Filters](#default_filters)).

# [Folder Traversal](#folder_traversal)

By default, folders matching the active filters are still traversed during comparison — they are hidden from the view but their contents are read.

The option **Traverse the folders that match the 'File Filters'** in the **Comparison** tab controls this behaviour.

When this option is **disabled**, folders matching the filters are not traversed at all. This makes the scan faster, but those folders will appear empty in the view even if they contain files.

![image]({{ site.prefixDir }}img/screenshots/folder/fileFilters/traverseFileFilters.png){:.wiki-img}

**Example — completely skip build output directories**

If your project has large `build/` or `DerivedData/` folders you never need to compare, you can exclude them *and* skip reading their contents entirely:

1. Open the Session Preferences **File Filters** tab.
2. Add a rule: `Name` **is** `build`
   (add a second rule `Name is DerivedData` if needed, with operator set to **Any**)
3. Switch to the **Comparison** tab.
4. **Disable** the option **Traverse the folders that match the 'File Filters'**.

With traversal disabled, VisualDiffer does not read the contents of matching folders at all. The scan is significantly faster on large trees.

With traversal **enabled** (the default), filtered folders are hidden from the view but their contents are still read. This is useful when you want to hide a folder from the comparison results but still allow copy or delete actions on files inside it.

