---
permalink: fileLegend.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: fileLegend
title: File Colors Legend
subtitle: Colors used in File Differ View
---

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
