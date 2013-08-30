---
permalink: faq.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: faq
title: Frequently Asked Questions
---

Finder integration
==================

Should I select files (or folders) from Finder context menu?
-----

VisualDiffer app doesn't directly offer a way to integrate with Finder but you can use the Automator script available on [VisualDiffer Hub](https://github.com/visualdiffer).

Download the script from [github](https://github.com/visualdiffer/scripts/downloads), unzip it and double click on workflow file to install.

How to use it is described [here](https://github.com/visualdiffer/scripts)

Use as External Diff Tool
=========================

VisualDiffer can be integrated with many applications thanks to the command line utility [visdiff](unix_shell_support.html)

[SourceTree](http://www.sourcetreeapp.com/)
------------------------------------------------------

- Set 'Visual Diff Tool' to: 'Other'
- Set 'Diff Command' to: /Applications/VisualDiffer.app/Contents/Resources/visdiff
- Set Arguments to: $LOCAL $REMOTE

VisualDiffer always prompts for a file open panel, why?
=======================================================

Starting from version 1.4.2 VisualDiffer totally agree with 
[Apple sandboxing](http://developer.apple.com/library/mac/#documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html) rules and this introduced a different way to access to file system.

Open existing vdiff sessions
----------------------------
Saved vdiff sessions needs to be aware of sandbox so the first time you open them you should be prompted to select left and right folders/files, then you need to **re-save** session so VisualDiffer stores the paths as trusted and no longer shows file open panel.

Integration with other applications
-----------------------------------
If VisualDiffer is used as external diff tool you should need to add manually paths as trusted, this is documented on [Trusted Paths](trustedPaths.html)

Customize the file date/time format in Folder Differ View
=========================================================
<span style="color:red">Since version 1.4.4 or above</span>

By default the Folder Differ View shows for files and folders a long format containing also seconds, actually this value can't be changed from user interface but you can set it from terminal.

Change format
-------------
Open the terminal application and type

    defaults write com.visualdiffer folderViewDateFormat HHmmss

Example above sets the format to show only the time (without date), format patterns can be found at [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns)

Restore default value
---------------------

If you want to restore default value, open terminal and type

    defaults delete com.visualdiffer folderViewDateFormat
