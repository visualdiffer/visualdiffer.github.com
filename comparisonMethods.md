---
permalink: comparisonMethods.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: comparisonMethod
title: Comparison Method
subtitle: The folders comparison method, special files and metadata
---

# Comparison Method

It is possible to choose which method to use to compare two folders.  
The method to use is strictly related to user needs, comparing source code (files large only few kilobytes) should use a content comparison but to find which movies (files larger than a gigabytes) are not present on right side is faster compare by file size or file timestamp.

Every file is treated as binary and it is compared byte by byte, only 'Compare file content ignoring line ending differences' compares text.

The complete list of supported comparison methods

<table class="bordered">
<tr>
<th>Method</th>
<th>Description</th>
</tr>
<tr>
<td>Compare file sizes
<br/>Very quick</td>
<td>Two file are identical if they have the same file size</td>
</tr>
<tr>
<td>Compare file timestamps
<br/>Very quick</td>
<td>Two file are identical if they have the same timestamp.
<br/>It is used the Unix <strong>last modified date</strong> for comparison.
<br/>If file A timestamp is less than file B it is marked as <strong>older</strong> and it will be shown with different color. 
<br/>It is possible to set a span in seconds to consider two files with same timestamp, see below</td>
</tr>
<tr>
<td>Compare file timestamps and sizes
<br/>Very quick</td>
<td>Compare the files timestamp, only if it is different then compare the size.</td>
</tr>
<tr>
<td>Compare file content only
<br/>Slow on large files</td>
<td>Compare files as binary, byte by byte</td>
</tr>
<tr>
<td>Compare file timestamp, size and content
<br/>Slow on large files</td>
<td>Compare the file content, only if content is different compare the timestamp and only if timestamp differs compare size</td>
</tr>
<tr>
<td>Compare file content ignoring line ending differences
<br/>Slow on large files</td>
<td>Compare file as plain text, read line by line and compare lines.
<br/>The line ending character is ignored so a DOS file (with lines separated by CR+LF) matches an Unix file (with lines separated by LF) if, ignoring the newlines, the content is identical</td>
</tr>
</table>


# Compare Finder Metadata

It is possible to compare OSX Finder Metadata.

When the metadata comparison mismatches, for example left file's label is red and right file's label is blue, the other comparison methods (size, timestamp, content) are not evaluated.

The complete list of supported metadata

<table class="bordered">
<tr>
<th>Metadata</th>
<th>Description</th>
</tr>
<tr>
<td>Label</td>
<td>Compare all labels assigned to a file</td>
</tr>
<tr>
<td>Tags
<br/><strong>Available in OSX 10.9 or above</strong></td>
<td>Compare all tags assigned to a file</td>
</tr>
</table>


# Special Files Handling

User can choose to not traverse special files like symbolic links and packages

<table class="bordered">
<tr>
<th>File</th>
<th>Description</th>
</tr>
<tr>
<td>Follow Symbolic Links</td>
<td>If checked the symbolic links will be traversed</td>
</tr>
<tr>
<td>Skip Packages</td>
<td>If checked special OSX files (so called bundle or packages)
<br/>like Applications and Frameworks will not be traversed</td>
</tr>
<tr>
<td>Check Resource Forks</td>
<td>Check if files are <a href="http://en.wikipedia.org/wiki/Resource_fork">resource forks</a>, this can slow down the comparison.<br/>
When this option is on if the file is a resource fork its size is determined from its structured data.
</td>
</tr>
</table>


# Timestamp Tolerance

The timestamp comparison considers two files matching when the time (including the seconds) is identical but sometime it would be useful to have a range of tolerance for example when the difference is between 5 seconds.

You can set this tolerance entering a positive integer number into the text field

Ignore differences of X seconds or less 


# Choose Files to View according to differences found

After the comparison complete you can choose which files to view

Definition: **Orphan** indicates a file present only on one side

The complete list of show options

<table class="bordered">
<tr>
<th>Choice</th>
<th>Description</th>
</tr>
<tr>
<td>Show All</td>
<td>No matters which comaprison result, show files</td>
</tr>
<tr>
<td>Only Mismatches</td>
<td>Show only files with some mismatch (size, timestamp or content)</td>
</tr>
<tr>
<td>Only Matches</td>
<td>Show only identical files</td>
</tr>
<tr>
<td>No Orphans</td>
<td>Show files present both on left and right side</td>
</tr>
<tr>
<td>Only Orphans</td>
<td>Show files present only on left or only on right</td>
</tr>
</table>

