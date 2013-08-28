---
permalink: trustedPaths.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: trustedPaths
title: Trusted Paths
subtitle: How to handle paths with Apple sandbox
---

Why we need trusted paths
=========================

Starting from OSX Lion applications run in the so called [sandbox](http://developer.apple.com/library/mac/#documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html) that is an isolated and secure environment.  
Applications accessing to file system (reading file, listing a folder) need explicitly that user gives permission to application.  
User gives his permission to access to a file (or folder) selecting it from a file panel or dragging path to application.  
VisualDiffer prompts a file panel when it can't access to a file due to permission error, after user selection the path is stored as trusted so next time it isn't necessary to re-prompt.

Using VisualDiffer as external diff tool with sandbox
=====================================================

VisualDiffer can be used to compare files using other applications ([Dreamweaver](http://www.adobe.com/products/dreamweaver.html), [SourceTree](http://www.sourcetreeapp.com/) and so on), for example to compare a remote file version with the local one.

Applications like Dreamweaver save to temporary file the remote version and then pass the generated full path to VisualDiffer but this path isn't trusted so VisualDiffer shows the file panel every time.

This behaviour generates a very frustrating user experience because the user must select the file from the panel again and again.

Use trusted paths
=================

Trusted paths resolve this problem, applications save files always on their own specific temporary folders, for example SourceTree can generate the following path

	/var/folders/mr/5dfd6w717cj5j374q24fdxsh0000gn/T/2PhpDQ_UnifiedDiff.m

but trusting it works only once because the path component **5dfd6w717cj5j374q24fdxsh0000gn/T/** is randomly generated and changes every time.

We can trust **/var/folders** that is the root used by SourceTree to saves temporary files.

Trusting **/var/folders** ensures every path generated inside it (at any deeper subfolder level) doesn't require any additional user permission and the file panel prompts no longer appears

Where configure trusted paths
=============================

You can add and removed trusted paths from VisualDiffer Preference panel
