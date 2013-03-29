---
permalink: unix_shell_support.html
layout: default
title: Unix Shell Scripting Support
---

Using visdiff
=============

Inside /Applications/VisualDiffer.app/**Contents/Resources** folder it is present the executable file visdiff that integrates with VisualDiffer.app

You can launch visdiff to visually show files or folders comparison using the following syntax

	visdiff <left file or folder> <right file or folder>

Wait for document close
=======================

If you need to wait the user closes the diff document window (not necessary to quit application) associated to visdiff command you can pass the switch **--wait**

For example

	visdiff ~/original.txt ~/modified.txt --wait

Creating a symbolic link
========================

VisualDiffer.app doesn't install the Terminal application but manually it is possible to create the link to the shell command.

It requires root access, from a terminal prompt type the command shown below

	sudo ln -s /Applications/VisualDiffer.app/Contents/Resources/visdiff /usr/bin/visdiff

<span style="color:red; font-weight:bold">Note:</span> **VisualDiffer can't install command line tool from its User Interface to comply with Apple's submission guidelines**

OSX sandbox, temporary files and annoying file open panel prompts
=================================================================

VisualDiffer was sandboxed starting from version 1.4.2 and many users found using it very annoying because any comparison prompts to pick folders/files.

This problem was fixed on version 1.4.3 introducing the so called "Trusted Paths", please refer to [Trusted Paths](trustedPaths.html) for further details
