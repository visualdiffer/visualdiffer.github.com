Hidden settings
===

Some settings aren't available from the preferences panel and must be set from CLI.

Comparision completed notification
--

`showNotificationWhenWindowIsOnFront` (`boolean`, default `false`)

If `true` the notification is shown always, otherwise only when the application window isn't in foreground

    defaults write com.visualdiffer showNotificationWhenWindowIsOnFront true

Customize the file date/time format in Folder Differ View
--

`folderViewDateFormat` (`string`, default taken from system locale settings)

It possible to change how time is shown in the Folder Differ View

Change format
-------------
Open the terminal application and type

    defaults write com.visualdiffer folderViewDateFormat HHmmss

Example above sets the format to show only the time (without date), format patterns can be found at [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns)

Restore default value
===

In any moment it is possible to restore default value deleting the key

    defaults delete com.visualdiffer showNotificationWhenWindowIsOnFront
    defaults delete com.visualdiffer folderViewDateFormat
