---
permalink: fileFilters.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: fileFilters
title: File Filters
subtitle: Filters can be used to exclude files from comparison, copy and delete actions
---

Files can be excluded from comparison by specifying filenames, relative paths, file sizes, and file modification dates.

# Filename Filters

Available filters for filenames are shown below.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Comparator Filter</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Contains</td>
                <td>Filename contains the specified string</td>
            </tr>
            <tr>
                <td>Begins with</td>
                <td>Filename begins with the specified string</td>
            </tr>
            <tr>
                <td>Ends with</td>
                <td>Filename ends with the specified string</td>
            </tr>
            <tr>
                <td>Is</td>
                <td>Filename is equal to the specified string</td>
            </tr>
            <tr>
                <td>Is not</td>
                <td>Filename is not equal to the specified string</td>
            </tr>
            <tr>
                <td>Is like</td>
                <td>Filename equals the specified string
                    <br/>? and * are allowed as wildcard characters, where ? matches 1 character and * matches 0 or more characters</td>
            </tr>
        </tbody>
    </table>
</div>

# Path Filters

It is possible to filter by specifying a path relative to the root; this allows you to exclude specific paths.  
Example:  

Left root path: <strong>/Users/dave/sources/</strong>  
Folder content  
<pre>
/Users/dave/sources/
&nbsp;&nbsp;project_1
&nbsp;&nbsp;&nbsp;&nbsp;src/
&nbsp;&nbsp;project_2
&nbsp;&nbsp;&nbsp;&nbsp;src/
&nbsp;&nbsp;&nbsp;&nbsp;index.txt
</pre>
To exclude only the folder <strong>src</strong> under <strong>project_1</strong> you can specify <strong>project_1/src</strong> as the path filter.  
The path is relative to root <strong>/Users/dave/sources/</strong>; you can use both folders and files as a path filter.  
The context menu item 'Exclude' automatically excludes folders as a path.  

Be careful not to add extra characters; the following paths will never be found:  
<strong>project_1//src</strong>&nbsp;&nbsp;&nbsp;invalid, double slash  
<strong>project_1/src/</strong>&nbsp;&nbsp;&nbsp;invalid, trailing slash  


# File Size Filters

It is possible to specify files (not folders) to exclude based on their size expressed in bytes, KB, MB and GB.

# File Modification Date Filters

It is possible to specify files (not folders) to exclude based on their last modification date and time.
