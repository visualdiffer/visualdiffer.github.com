---
permalink: hiddenSessings.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: hiddenSessings
title: Hidden settings
subtitle: Settings not yet available from the preferences panel
---

Hidden settings
===

Some settings aren't available from the preferences panel and must be set from the CLI.

Comparison completed notification
--

`showNotificationWhenWindowIsOnFront` (`boolean`, default `false`)

If `true` the notification is always shown, otherwise only when the application window isn't in the foreground.

    defaults write com.visualdiffer showNotificationWhenWindowIsOnFront true

Customize the file date/time format in Folder Differ View
--

`folderViewDateFormat` (`string`, default taken from system locale settings)

It is possible to change how time is shown in the Folder Differ View.

Change format
-------------
Open the terminal application and type:

    defaults write com.visualdiffer folderViewDateFormat HHmmss

The example above sets the format to show only the time (without date); format patterns can be found at [Unicode Technical Standard #35](https://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns).

Restore default value
===

At any time it is possible to restore the default value by deleting the key:

    defaults delete com.visualdiffer showNotificationWhenWindowIsOnFront
    defaults delete com.visualdiffer folderViewDateFormat
