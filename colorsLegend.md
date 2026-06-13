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

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Folder</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-000.png"></td>
                <td>Matched folder (all contained files are the same on the other side)</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-001.png"></td>
                <td>Folder contains only files older than the other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-010.png"></td>
                <td>Folder contains only modified files</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-011.png"></td>
                <td>Folder contains only modified files and files older than the other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-100.png"></td>
                <td>Folder contains only files not present on the other side (so-called orphan folder)</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-101.png"></td>
                <td>Folder contains files not present on the other side and files older than the other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-110.png"></td>
                <td>Folder contains modified files and files not present on the other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/screenshots/folder/view/folders/folder-999.png"></td>
                <td>Folder matches <a href="fileFilters.html#show_filtered_files">file filters</a> or is empty and the 'Empty folders' setting is on</td>
            </tr>
        </tbody>
    </table>
</div>

# [File Colors](#file_colors)

Line colors in the File Differ View are based on differences found.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Color</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="file-legend-same"></td>
                <td>Text content on left and right is the same</td>
            </tr>
            <tr>
                <td class="file-legend-different"></td>
                <td>Text content present on the left differs from text content present on the right</td>
            </tr>
            <tr>
                <td class="file-legend-missing-left"></td>
                <td>Text content is present only on the right; on the left the line is missing</td>
            </tr>
            <tr>
                <td class="file-legend-missing-right"></td>
                <td>Text content is present only on the left; on the right the line is missing</td>
            </tr>
            <tr>
                <td class="file-legend-merged"></td>
                <td>Text content has been copied from the other side; this marks the document as edited and it can be saved</td>
            </tr>
        </tbody>
    </table>
</div>

# [Difference Indicator](#difference_indicator)

The narrow strip on the right side of the file diff view gives a bird's-eye view of all differences across the whole file.

![image]({{ site.prefixDir }}img/screenshots/file/differenceIndicator.png){:.wiki-img}

Each colored mark corresponds to a difference section; the colors match those in the diff table. The current scroll position is shown as a highlighted band. Click anywhere on the indicator to jump directly to that part of the file.
