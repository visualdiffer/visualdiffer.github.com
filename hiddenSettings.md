---
permalink: hiddenSettings.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: hiddenSettings
title: Hidden Settings
subtitle: Settings not yet available from the preferences panel
---

Some settings are not exposed in the Preferences panel and must be configured from the terminal using the `defaults` command.

**General pattern**

    defaults write com.visualdiffer <key> <value>

**Reset to default**

    defaults delete com.visualdiffer <key>

Changes take effect the next time the application is launched.

# [Settings](#settings)

Click any row in the **Example** column to copy the full command to the clipboard.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Key</th>
                <th>Default</th>
                <th>Description</th>
                <th>Example</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><code>alwaysResolveSymlinks</code></td>
                <td>YES</td>
                <td>Resolve symbolic links when determining file paths.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer alwaysResolveSymlinks -bool false">
                    <code>-bool false</code>
                </td>
            </tr>
            <tr>
                <td><code>colorsConfigPath</code></td>
                <td>—</td>
                <td>Path to a JSON file containing a custom color configuration.
                    Recommended location: <code>~/Library/Application Scripts/com.visualdiffer</code></td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer colorsConfigPath &quot;/Users/&lt;&lt;username&gt;&gt;/Library/Application Scripts/com.visualdiffer/vd-colors.json&quot;">
                    <code>"/path/to/vd-colors.json"</code>
                </td>
            </tr>
            <tr>
                <td><code>defaultEncoding</code></td>
                <td>UTF-8</td>
                <td>Default character encoding for opening text files.
                    The value is the <code>CFStringEncoding</code> integer identifier.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer defaultEncoding -int 30">
                    <code>-int 30</code>
                </td>
            </tr>
            <tr>
                <td><code>filesStatusBarShowMessageTimeout</code></td>
                <td>3</td>
                <td>Seconds a status bar message stays visible in the file diff view before the counters are restored.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer filesStatusBarShowMessageTimeout -int 5">
                    <code>-int 5</code>
                </td>
            </tr>
            <tr>
                <td><code>foldersDifferenceNavigatorCenterInWindow</code></td>
                <td>YES</td>
                <td>Center the selected difference in the folder comparison window when navigating.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer foldersDifferenceNavigatorCenterInWindow -bool false">
                    <code>-bool false</code>
                </td>
            </tr>
            <tr>
                <td><code>folderViewDateFormat</code></td>
                <td><code>ddMMyyHHmmss</code></td>
                <td>Date and time format used in the folder diff view.
                    Pattern syntax: <a href="https://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns">Unicode Technical Standard #35</a></td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer folderViewDateFormat HHmmss">
                    <code>HHmmss</code>
                </td>
            </tr>
            <tr>
                <td><code>showNotificationWhenWindowIsOnFront</code></td>
                <td>NO</td>
                <td>When <code>NO</code>, completion notifications are shown only when the app is in the background.
                    When <code>YES</code>, notifications are always shown.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer showNotificationWhenWindowIsOnFront -bool true">
                    <code>-bool true</code>
                </td>
            </tr>
            <tr>
                <td><code>showRecentDocumentsList</code></td>
                <td>NO</td>
                <td>Show the Recent Documents popup menu on the main window.</td>
                <td class="copy-cmd"
                    data-cmd="defaults write com.visualdiffer showRecentDocumentsList -bool true">
                    <code>-bool true</code>
                </td>
            </tr>
        </tbody>
    </table>
</div>

# [How to Use a Custom Color Scheme](#how_to_use_a_custom_color_scheme)

**Installation**

Use the <a href="colors.html" target="_blank" rel="noopener" aria-label="Color Scheme Editor (opens in a new tab)">Color Scheme Editor</a> to create a custom color scheme, then download the JSON file. For example, save the file as `~/Downloads/my-scheme.json`.

Open Terminal and run the following commands.

Copy the file to a directory that the VisualDiffer sandbox can access.

```sh
cp ~/Downloads/my-scheme.json ~/Library/Application\ Scripts/com.visualdiffer
```

Set the `colorsConfigPath` property to the full path of the copied file.

```sh
defaults write com.visualdiffer colorsConfigPath ~/Library/Application\ Scripts/com.visualdiffer/my-scheme.json
```

Changes to the color scheme take effect only after you restart VisualDiffer.

Custom color schemes do not respond to changes between Light and Dark appearances. If you switch the appearance, the custom color scheme remains active.

**Restore the Default Setting**

To stop using the custom color scheme, run the following command:

```sh
defaults delete com.visualdiffer colorsConfigPath
```
