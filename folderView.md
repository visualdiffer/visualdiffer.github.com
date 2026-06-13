---
permalink: folderView.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: folderView
title: Folder Compare View
subtitle: Overview of the folder comparison window
---

The folder comparison window shows two directory trees side by side and lets you compare, navigate, and act on their contents.

# [Main Areas](#main_areas)

![image]({{ site.prefixDir }}img/screenshots/folder/view/main.png){:.wiki-img}

**① Toolbar** — quick access to comparison, file operations, and session preferences.

**② Path control** — shows the left and right root paths. Click to change a path, or drag a folder from Finder onto it.

**③ Folder trees** — the two directory trees shown side by side. Files and folders are color-coded to reflect the comparison result; see [Colors Legend](colorsLegend.html) for details.

**④ Scope bar** — filters what is shown in the trees. See [Scope Bar](#scope_bar) below.

# [Scope Bar](#scope_bar)

![image]({{ site.prefixDir }}img/screenshots/folder/view/scopeBar.png){:.wiki-img}

The scope bar has three independent groups.

## [Display Filter](#scope_bar_display_filter)

The first group is a radio selector; only one choice is active at a time.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Segment</th>
                <th>Shows</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>All</td>
                <td>Every file and folder regardless of comparison result</td>
            </tr>
            <tr>
                <td>Only Mismatches</td>
                <td>Files that differ: newer on one side, modified content, or orphan</td>
            </tr>
            <tr>
                <td>Only Matches</td>
                <td>Only identical files</td>
            </tr>
            <tr>
                <td>No Orphans</td>
                <td>Mismatches and matches, but without files that exist on one side only</td>
            </tr>
            <tr>
                <td>Only Orphans</td>
                <td>Only files present on one side only</td>
            </tr>
        </tbody>
    </table>
</div>

## [Folders](#scope_bar_folders)

The **Folders:** group contains two independent toggles that control folder visibility. Both can be active at the same time.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Toggle</th>
                <th>Effect when active</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Empty</td>
                <td>Shows folders that are empty on disk or whose entire contents are excluded
                    by the active <a href="fileFilters.html">file filters</a>.
                    Empty folders are hidden by default.</td>
            </tr>
            <tr>
                <td>No Orphans</td>
                <td>Hides folders that exist on one side only (orphan folders).
                    This only affects folder visibility; orphan <em>files</em> inside
                    non-orphan folders are still shown according to the display filter above.</td>
            </tr>
        </tbody>
    </table>
</div>

## [Filtered](#scope_bar_filtered)

The **Filtered** toggle shows or hides items excluded by the active file filters. See [Show Filtered Files](fileFilters.html#show_filtered_files) for details.

# [Selecting Items](#selecting_items)

The Edit menu provides several ways to select items in the active tree. Hold **⌥ Option** while opening the menu to reveal the **Both Sides** variant of each command, which acts on both trees at once.

## [Select by Type](#select_by_type)

- **Select All** — selects every visible item in the active tree.
- **Select All Files** — selects only files, skipping folders.
- **Select All Folders** — selects only folders, skipping files.

## [Select Newer](#select_newer)

Selects the files that have a more recent modification date than their counterpart on the other side. Choose the side from the submenu:

- **Left Side** — selects files on the left that are newer than the corresponding right file.
- **Right Side** — selects files on the right that are newer than the corresponding left file.
- **Both Sides** — selects the newer file on each side simultaneously.

## [Select Orphans](#select_orphans)

Selects files that exist on one side only (no counterpart on the other side):

- **Left Side** — selects orphans on the left.
- **Right Side** — selects orphans on the right.
- **Both Sides** — selects orphans on both sides simultaneously.

## [Invert Selection](#invert_selection)

Reverses the current selection in the active tree. Hold **⌥ Option** to invert the selection on both trees at once.

# [Set as Base Folder](#set_as_base_folder)

When a folder is selected you can narrow the comparison to just that folder by choosing **Set as Base Folder** from the Actions menu. This replaces the current root with the selected folder, effectively zooming in. Three variants are available:

- **Set as Base Folder** — changes the root on the side where the selection is.
- **Set as Base Folder on the Other Side** — changes the root on the opposite side.
- **Set as Base Folder Both Sides** — changes both roots to the selected folder (useful when the same subfolder exists on both sides).

# [Read-Only Mode](#read_only_mode)

Choose **Set Left Read-Only** or **Set Right Read-Only** from the View menu to prevent accidental file operations on that side. A read-only side still participates in comparisons but copy, move, and delete actions targeting it are disabled.

# [Swap Sides](#swap_sides)

**Swap Sides** (View menu) exchanges the left and right paths, reversing the direction of the comparison without re-running it.
