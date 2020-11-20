---
permalink: externalApps.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: externalApps
title: External Apps Integration
---

Integrate with other macOS applications
==================

VisualDiffer allows

- to view text files on external editors like BBEdit or SublimeText
- to compare files on external comparators like Kaleidoscope or the beloved BBEdit

The integration requires some shell scripts, they allow the editor caret to be moved at specific lines or open new buffers on existing application instance.

Text Editors
=======

Files can be open using your preferred text editor.
Select `Open With` from the context menu to select the destination application.  
In addiction you can configure the preferred editor from the Preference panel, the selected application will be shown on the top of `Open With` menu.

Open editor at specific line
-----

From the Files Diff window it's possible to pass to the application the selected line number so the cursor will move to it.  
It's necessary to create a Unix script and place it inside the directory

	/Users/<<username>>/Library/Application Scripts/com.visualdiffer/editors

The script must have a very specific file name ending with `.sh`.  
The file name is the so called `App Bundle Identifier` and can be found executing from the Terminal App the following command (the example uses Sublime Text)

	osascript -e 'id of app "/Applications/Sublime Text.app"'
	
that returns `com.sublimetext.3` so the file name will be

	com.sublimetext.3.sh
	
Some examples are available at [externalapp-integration](https://github.com/visualdiffer/externalapp-integration/tree/master/editors) repository

