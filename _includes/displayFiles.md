# [Choose Files to View according to differences found](#choose_files_to_view_according_to_differences_found)

After the comparison completes you can choose which files to view.  
Definition: **Orphan** indicates a file present only on one side.

The complete list of show options is below.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Choice</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Show All</td>
                <td>No matter the comparison result, show files</td>
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
                <td>Show files present both on left and right sides</td>
            </tr>
            <tr>
                <td>Only Orphans</td>
                <td>Show files present only on left or only on right</td>
            </tr>
        </tbody>
    </table>
</div>

## [Choose Folders to View](#choose_folders_to_view)

It is possible to hide empty and orphan folders.
Folders can be empty because they don't contain any files on disk or because all files/folders inside them are filtered.  
Orphan folders are present only on one side (left or right).

## [Show Filtered Files](#show_filtered_files)

When a filter finds matches the elements are not visible, but if it's necessary to show them you can click on the `Filtered` button.  
Default filters can be changed or totally deleted from `Session Preferences` window.  
Some files are excluded by default; the complete list is shown below.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Description</th>
                <th>File</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Backup and system files</td>
                <td>.DS_Store, *~</td>
            </tr>
            <tr>
                <td>Version Control System files </td>
                <td>CVS, .svn, .git, .hg, .bzr</td>
            </tr>
        </tbody>
    </table>
</div>
