---
permalink: colorsLegend.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: colorsLegend
title: Colors Legend
subtitle: Colors and icons used in folder and file comparison views
---

# [Folder Colors](#folder_colors)

Folders are shown using different colors to quickly visualize the file comparison results.

<div class="folder-legend-grid">
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-000.png" alt="Matched folder">
    <strong>Matched</strong>
    <span>All files identical on both sides</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-001.png" alt="Has older files">
    <strong>Has older</strong>
    <span>Contains files older than the other side</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-010.png" alt="Modified files">
    <strong>Modified</strong>
    <span>Contains modified files</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-011.png" alt="Modified and older files">
    <strong>Modified + older</strong>
    <span>Contains modified files and files older than the other side</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-100.png" alt="Orphan folder">
    <strong>Orphan</strong>
    <span>Files only on one side</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-101.png" alt="Orphan and older files">
    <strong>Orphan + older</strong>
    <span>Orphan files and files older than the other side</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-110.png" alt="Orphan and modified files">
    <strong>Orphan + modified</strong>
    <span>Orphan files and modified files</span>
  </div>
  <div class="folder-legend-card">
    <img src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-999.png" alt="Filtered or empty folder">
    <strong>Filtered / Empty</strong>
    <span>Matches active <a href="fileFilters.html#show_filtered_files">file filters</a> or is empty</span>
  </div>
</div>

# [File Colors](#file_colors)

Line colors in the File Differ View are based on differences found.

<div class="folder-legend-grid">
  <div class="folder-legend-card">
    <div class="file-legend-swatch file-legend-same"></div>
    <strong>Same</strong>
    <span>Left and right content is identical</span>
  </div>
  <div class="folder-legend-card">
    <div class="file-legend-swatch file-legend-different"></div>
    <strong>Different</strong>
    <span>Left content differs from right</span>
  </div>
  <div class="folder-legend-card">
    <div class="file-legend-swatch file-legend-missing-left"></div>
    <strong>Missing left</strong>
    <span>Line present only on the right; missing on the left</span>
  </div>
  <div class="folder-legend-card">
    <div class="file-legend-swatch file-legend-missing-right"></div>
    <strong>Missing right</strong>
    <span>Line present only on the left; missing on the right</span>
  </div>
  <div class="folder-legend-card">
    <div class="file-legend-swatch file-legend-merged"></div>
    <strong>Merged</strong>
    <span>Content copied from the other side; file is marked as edited</span>
  </div>
</div>

# [Difference Indicator](#difference_indicator)

The narrow strip on the right side of the file diff view gives a bird's-eye view of all differences across the whole file.

![image]({{ site.prefixDir }}img/screenshots/file/differenceIndicator.png){:.wiki-img}

Each colored mark corresponds to a difference section; the colors match those in the diff table. The current scroll position is shown as a highlighted band. Click anywhere on the indicator to jump directly to that part of the file.
