---
permalink: foldersLegend.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: foldersLegend
title: Folder Colors Legend
subtitle: Folders icons assume colors based on their content or filter status
---

Folders are shown using different colors to quickly visualize the files comparison results

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
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-000.png"></td>
                <td>Matched folder (all contained files are same on other side)</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-001.png"></td>
                <td>Folder contains only older files than other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-010.png"></td>
                <td>Folder contains only modified files</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-011.png"></td>
                <td>Folder contains only modified files and files older than other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-100.png"></td>
                <td>Folder contains only files not present on other side (so called orphan folder)</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-101.png"></td>
                <td>Folder contains files not present on other side and files older that other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-110.png"></td>
                <td>Folder contains modified files and files not present on the other side</td>
            </tr>
            <tr>
                <td><img class="folder-legend" src="{{ site.prefixDir }}img/ternaryop/vd/folders/folder-999.png"></td>
                <td>Folder matches file filters or is empty and the 'Empty folders' setting is set to on</td>
            </tr>
        </tbody>
    </table>
</div>


