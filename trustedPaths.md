---
permalink: trustedPaths.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: trustedPaths
title: Trusted Paths
subtitle: How to handle paths with Apple sandbox
---

[Why we need trusted paths](#why_we_need_trusted_paths)
=========================

Starting from macOS Lion, applications run in the so-called [sandbox](https://developer.apple.com/library/mac/#documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html), an isolated and secure environment.  
Applications accessing the file system (reading a file, listing a folder) need explicit permission from the user.  
The user grants permission to access a file (or folder) by selecting it from a file panel or dragging the path to the application.  
VisualDiffer prompts a file panel when it can't access a file due to a permission error; after the user selects it the path is stored as trusted so next time it isn't necessary to re-prompt.

[Using VisualDiffer as external diff tool with sandbox](#using_visualdiffer_as_external_diff_tool_with_sandbox)
=====================================================

VisualDiffer can be used to compare files using other applications, for example to compare a remote file version with the local one.

Applications like Dreamweaver save the remote version to a temporary file and then pass the generated full path to VisualDiffer, but this path isn't trusted, so VisualDiffer shows the file panel every time.

This behaviour generates a very frustrating user experience because the user must select the file from the panel again and again.

[Use Trusted Paths](#use_trusted_paths)
=================

Trusted paths resolve this problem because applications save files in their own specific temporary folders; for example SourceTree can generate the following path:

	/var/folders/mr/5dfd6w717cj5j374q24fdxsh0000gn/T/2PhpDQ_UnifiedDiff.m

but trusting it works only once because the path component **5dfd6w717cj5j374q24fdxsh0000gn/T/** is randomly generated and changes every time.

We can trust **/var/folders**, which is the root used by SourceTree to save temporary files.

Trusting **/var/folders** ensures every path generated inside it (at any deeper subfolder level) doesn't require any additional user permission and the file panel prompts no longer appear.

[Where to configure Trusted Paths](#where_configure_trusted_paths)
=============================

You can add (drag&drop is supported) and/or remove paths manually from the VisualDiffer Preference panel.  
The paths colored in red no longer exist.
