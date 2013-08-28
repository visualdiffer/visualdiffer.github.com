---
permalink: alignRules.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: alignRules
title: File Names Alignment Rules
subtitle: Change the default file names alignment method
---

Before being compared two files they must be aligned, the alignment rule can be configured

# Align by name case sensitivity

The default alignment method compares file name strings, if they are match case then they will be aligned.  
Suppose you have the scenario shown below

<table class="bordered">
<tr>
<th>Left</th>
<th>Right</th>
</tr>
<tr>
<td>winter.jpg</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>WINTER.JPG</td>
</tr>
<tr>
<td>summer.jpg</td>
<td>summer.jpg</td>
</tr>
</table>

By default winter.jpg and WINTER.JPG will be not aligned because their strings don't match uppercase and lowercase characters.

This result sometimes isn't what you expect, maybe you want to ignore uppercase/lowercase differences.  
This can be achieved selecting 'Ignore File Name Case' from popup menu.</p>

<table class="bordered">
<tr>
<th>Left</th>
<th>Right</th>
</tr>
<tr>
<td>winter.jpg</td>
<td>WINTER.JPG</td>
</tr>
<tr>
<td>summer.jpg</td>
<td>summer.jpg</td>
</tr>
</table>

# Align by HFS+ filesystem case

Normally the <acronym title="Hierarchical File System">HFS+</acronym> disks are formatted ignoring the file name case, so if we have winter.jpg and WINTER.JPG they cannot be created on same directory (because they have the same name).

When the HFS+ partitions are formatted with case sensitive support the file names winter.jpg and WINTER.JPG are two different file names and can be created on same directory.

It is possible to let VisualDiffer determine the file name alignment case algorithm looking at HFS partition case, so three scenarios are possible

1. left and right are both case insensitive
2. left and right are both case sensitive
3. left/right is case sensitive and right/left is case insensitive

If the last scenario is true, the alignment will try to be smart, first it searches if a match case is available (winter.jpg with winter.jpg) then it tries to align with the most similar name.

# Align by user defined rules (not available on OSX 10.6 Snow Leopard)

TODO
