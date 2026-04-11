---
permalink: unixshell.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: unixShell
title: Unix Shell Scripting Support
subtitle: Launching the UI from the Unix command line
---

[Using visdiff](#using_visdiff)
=============

The /Applications/VisualDiffer.app/**Contents/Helpers** folder contains the executable file `visdiff` that integrates with VisualDiffer.app.  
You can launch `visdiff` to visually show a comparison of files or folders using the following syntax:

	visdiff <left file or folder> <right file or folder>

**Note:** On versions older than 1.8.0  `visdiff` is located at `/Applications/VisualDiffer.app/Contents/Resources/visdiff`

[Wait for document close](#wait_for_document_close)
=======================

If you need to wait until the user closes the diff document window (not necessarily quitting the application) associated with the visdiff command, you can pass the switch `--wait`.

For example

{% highlight bash %}
$ visdiff ~/original.txt ~/modified.txt --wait
{% endhighlight %}


[Creating a symbolic link](#creating_a_symbolic_link)
------------------------

VisualDiffer.app doesn't install the terminal application, but you can manually create the link to the shell command.  
It requires root access; from a terminal prompt type the command shown below.

{% highlight bash %}
$ sudo ln -s /Applications/VisualDiffer.app/Contents/Helpers/visdiff /usr/bin/visdiff
{% endhighlight %}

<span style="color:red; font-weight:bold">Note:</span> **VisualDiffer can't install the command line tool from its User Interface to comply with Apple's submission guidelines**

[macOS sandbox, temporary files and annoying file open panel prompts](#macos_sandbox_temporary_files_and_annoying_file_open_panel_prompts)
=================================================================

VisualDiffer was sandboxed starting from version 1.4.2 and many users found using it very annoying because any comparison prompts to pick folders/files.  
This problem was fixed in version 1.4.3 by introducing the so-called "Trusted Paths"; please refer to [Trusted Paths](trustedPaths.html) for further details.

[How visdiff resolves relative paths](#relative_paths)
========================================================

`visdiff` is a sandboxed application. Because of that, even when you launch it from a regular terminal, relative paths are resolved from the home directory of the sandbox container, not from the current working directory of the shell.

This can make VisualDiffer report that a file does not exist because it looks for it in the wrong location.

The most reliable solution is to expand the relative path with `$PWD` so the final path is built from the current working directory before `visdiff` receives it.

Instead of:

{% highlight bash %}
$ visdiff ../myfile.txt
{% endhighlight %}

Use:

{% highlight bash %}
$ visdiff $PWD/../myfile.txt
{% endhighlight %}
