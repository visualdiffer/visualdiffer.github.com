# [Comparison Method](#comparison_method)

It is possible to choose which method to use to compare two folders.  
The method to use is strictly related to user needs; comparing source code (files only a few kilobytes large) should use a content comparison, but finding which movies (files larger than a gigabyte) are not present on the right side is faster when comparing by file size or file timestamp.  
Every file is treated as binary and compared byte by byte; only 'Compare file content ignoring line ending differences' compares text.

The complete list of supported comparison methods is below.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Method</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Compare file names only<br/>Very quick</td>
                <td>Two files are identical if they have the same name (including file extension).
                    <br/>No content, size, or timestamp is read.</td>
            </tr>
            <tr>
                <td>Compare file sizes<br/>Very quick</td>
                <td>Two files are identical if they have the same file size</td>
            </tr>
            <tr>
                <td>Compare file timestamps<br/>Very quick</td>
                <td>Two files are identical if they have the same timestamp.
                    <br/>The Unix <strong>last modified date</strong> is used for comparison.
                    <br/>If file A's timestamp is less than file B's it is marked as <strong>older</strong> and it will be shown with a different color. 
                    <br/>It is possible to set a span in seconds to consider two files with the same timestamp, see below</td>
            </tr>
            <tr>
                <td>Compare file timestamps and sizes<br/>Very quick</td>
                <td>Compare the file timestamps; only if they are different compare the size.</td>
            </tr>
            <tr>
                <td>Compare file content only<br/>Slow on large files</td>
                <td>Compare files as binary, byte by byte</td>
            </tr>
            <tr>
                <td>Compare file timestamp, size and content<br/>Slow on large files</td>
                <td>Compare the file size; only if the size is equal compare the file content as binary, byte by byte. If the files differ but have the same timestamp, they are marked as <strong>changed</strong> (content modified without a modification date update).</td>
            </tr>
            <tr>
                <td>Compare file content ignoring line ending differences<br/>Slow on large files</td>
                <td>Compare files as plain text, reading line by line and comparing lines.<br/>The line ending character is ignored so a DOS file (with lines separated by CR+LF) matches a Unix file (with lines separated by LF) if, ignoring the newlines, the content is identical</td>
            </tr>
        </tbody>
    </table>
</div>
