# [Comparison Method](#comparison_method)

It is possible to choose which method to use to compare two folders.  
The method to use is strictly related to user needs, comparing source code (files large only few kilobytes) should use a content comparison but to find which movies (files larger than a gigabytes) are not present on right side is faster compare by file size or file timestamp.  
Every file is treated as binary and it is compared byte by byte, only 'Compare file content ignoring line ending differences' compares text.

The complete list of supported comparison methods

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
                <td>Compare file sizes<br/>Very quick</td>
                <td>Two file are identical if they have the same file size</td>
            </tr>
            <tr>
                <td>Compare file timestamps<br/>Very quick</td>
                <td>Two file are identical if they have the same timestamp.
                    <br/>It is used the Unix <strong>last modified date</strong> for comparison.
                    <br/>If file A timestamp is less than file B it is marked as <strong>older</strong> and it will be shown with different color. 
                    <br/>It is possible to set a span in seconds to consider two files with same timestamp, see below</td>
            </tr>
            <tr>
                <td>Compare file timestamps and sizes<br/>Very quick</td>
                <td>Compare the files timestamp, only if it is different then compare the size.</td>
            </tr>
            <tr>
                <td>Compare file content only<br/>Slow on large files</td>
                <td>Compare files as binary, byte by byte</td>
            </tr>
            <tr>
                <td>Compare file timestamp, size and content<br/>Slow on large files</td>
                <td>Compare the file content, only if content is different compare the timestamp and only if timestamp differs compare size</td>
            </tr>
            <tr>
                <td>Compare file content ignoring line ending differences<br/>Slow on large files</td>
                <td>Compare file as plain text, read line by line and compare lines.<br/>The line ending character is ignored so a DOS file (with lines separated by CR+LF) matches an Unix file (with lines separated by LF) if, ignoring the newlines, the content is identical</td>
            </tr>
        </tbody>
    </table>
</div>
