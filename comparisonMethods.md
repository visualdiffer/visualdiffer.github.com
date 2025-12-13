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


# [Timestamp Tolerance](#timestamp_tolerance)

The timestamp comparison considers two files matching when the time (including the seconds) is identical, but sometimes it is useful to have a tolerance range, for example when the difference is around 5 seconds.  
You can set this tolerance by entering a positive integer number into the text field `Ignore differences of X seconds or less`.

{% include displayFiles.md %}
