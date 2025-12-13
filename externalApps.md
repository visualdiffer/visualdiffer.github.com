---
permalink: externalApps.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: externalApps
title: External Apps Integration
---

[Integrate with other macOS applications](#integrate_with_other_macos_applications)
==================

VisualDiffer allows you to:

- view text files on external editors like BBEdit or SublimeText
- compare files on external comparators like Kaleidoscope or the beloved BBEdit

The integration requires some shell scripts; they allow the editor caret to move to specific lines or open new buffers in an existing application instance.

[Text Editors](#text_editors)
=======

Files can be opened using your preferred text editor.
Select `Open With` from the context menu to select the destination application.  
In addition you can configure the preferred editor from the Preference panel; the selected application will be shown at the top of the `Open With` menu.

[Open editor at specific line](#open_editor_at_specific_line)
-----

From the Files Diff window it's possible to pass the selected line number to the application so the cursor will move to it.  
It's necessary to create a Unix script and place it inside the directory

	/Users/<<username>>/Library/Application Scripts/com.visualdiffer/editors

The script must have a very specific file name ending with `.sh`.  
The file name is the so-called `App Bundle Identifier` and can be found by executing from Terminal.app the following command (the example uses Sublime Text)

	osascript -e 'id of app "/Applications/Sublime Text.app"'
	
that returns `com.sublimetext.3` so the file name will be

	com.sublimetext.3.sh
	
Some examples are available at the [externalapp-integration](https://github.com/visualdiffer/externalapp-integration/tree/master/editors) repository.

You can install all integration scripts by running the command shown below:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/visualdiffer/externalapp-integration/HEAD/install.sh)"

**Warning** The script must have the execute flag set otherwise it will not be called (i.e. `chmod +x script`).  
The Console.app could contain error messages.
