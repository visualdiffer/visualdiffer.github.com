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

## Choose Folders to View

It is possible to hide empty and orphans folders.
Folders can be empty because they don't contains any file on disk or because all files/folders inside them are filtered.  
Orphans folders are present only on one side (left or right)

## Show Filtered Files

When a filter founds matches the elements are not visible but in case it's necessary to shown them you can click on the `Filtered` button

Some files are excluded by defaults, the complete list is shown below.  
Default filters can be changed or totally deleted from `Session Preferences` window

<table class="bordered">
<tr>
<th>Description</th>
<th>File</th>
</tr>
<tr>
<td>Backup and system files</td>
<td>.DS_Store, *~</td>
</tr>
<tr>
<td>Control Version System files </td>
<td>CVS, .svn, .git, .hg", .bzr</td>
</tr>
</table>
