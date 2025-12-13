---
permalink: faq.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: faq
title: Frequently Asked Questions
---

[Finder integration](#finder_integration)
==================

[Should I select files (or folders) from Finder context menu?](#should_i_select_files_or_folders_from_finder_context_menu)
-----

The VisualDiffer app doesn't directly offer a way to integrate with Finder, but you can use the Automator script available on [VisualDiffer Hub](https://github.com/visualdiffer).  
Download the script from [GitHub](https://github.com/visualdiffer/scripts/downloads), unzip it and double-click the workflow file to install.  
How to use it is described [here](https://github.com/visualdiffer/scripts).

[Use as External Diff Tool](#use_as_external_diff_tool)
=========================

VisualDiffer can be integrated with many applications thanks to the command-line utility [visdiff](unix_shell_support.html).

[SourceTree](https://www.sourcetreeapp.com/)
------------------------------------------------------

- Set 'Visual Diff Tool' to: 'Other'
- Set 'Diff Command' to: /Applications/VisualDiffer.app/Contents/Resources/visdiff
- Set Arguments to: $LOCAL $REMOTE

[VisualDiffer always prompts for a file open panel, why?](#visualdiffer_always_prompts_for_a_file_open_panel_why)
=======================================================

Starting from version 1.4.2 VisualDiffer fully complies with
[Apple sandboxing](https://developer.apple.com/library/mac/#documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html) rules and this introduced a different way to access the file system.

[Open existing vdiff sessions](#open_existing_vdiff_sessions)
----------------------------
Saved vdiff sessions need to be aware of the sandbox, so the first time you open them you should be prompted to select the left and right folders/files. Then you need to **re-save** the session so VisualDiffer stores the paths as trusted and no longer shows the file-open panel.

[Integration with other applications](#integration_with_other_applications)
-----------------------------------
If VisualDiffer is used as an external diff tool you may need to manually add paths as trusted; this is documented on [Trusted Paths](trustedPaths.html).

[Customize the file date/time format in Folder Differ View](#customize_the_file_date_time_format_in_folder_differ_view)
=========================================================
<span style="color:red">Since version 1.4.4 or above</span>

By default the Folder Differ View shows for files and folders a long format containing seconds; currently this value can't be changed from the user interface but you can set it from the terminal.

[Change format](#change_format)
-------------
Open the terminal application and type:

    defaults write com.visualdiffer folderViewDateFormat HHmmss

The example above sets the format to show only the time (without date); format patterns can be found at [Unicode Technical Standard #35](http://unicode.org/reports/tr35/tr35-6.html#Date_Format_Patterns).

[Restore default value](#restore_default_value)
---------------------

If you want to restore the default value, open terminal and type:

    defaults delete com.visualdiffer folderViewDateFormat
