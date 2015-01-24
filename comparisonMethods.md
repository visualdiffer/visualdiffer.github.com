---
permalink: comparisonMethods.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: comparisonMethod
title: Comparison Method
subtitle: The folders comparison method, special files and metadata
---

{% include comparisonMethods.md %}

{% include finderMetadata.md %}

{% include foldersTraversal.md %}


# Timestamp Tolerance

The timestamp comparison considers two files matching when the time (including the seconds) is identical but sometime it would be useful to have a range of tolerance for example when the difference is between 5 seconds.  
You can set this tolerance entering a positive integer number into the text field `Ignore differences of X seconds or less`

{% include displayFiles.md %}
