---
permalink: preferences/text.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: prefsText
title: Text Preferences
subtitle: Application Preferences - Text

# We are a level down the root directory
# so specify a page prefixDir to search a directory level up
prefixDir: ../
---

# Show additional difference indicator

Show a symbol near the lines to indicate the type of difference

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Symbol</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>!</td>
                <td>Left and right lines contain are different</td>
            </tr>
            <tr>
                <td>-</td>
                <td>Line is present on left but not on right side</td>
            </tr>
            <tr>
                <td>+</td>
                <td>Line is present on right but not on left side</td>
            </tr>
        </tbody>
    </table>
</div>

![image]({{ page.prefixDir }}{{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/differenceIndicator.png)

# Tab Width

Tab characters are replaces with spaces, it is possible to specify the number of spaces for tab