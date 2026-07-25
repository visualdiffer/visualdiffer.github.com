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

Applications run in the so-called [sandbox](https://developer.apple.com/documentation/security/app_sandbox), an isolated and secure environment.  
Applications accessing the file system (reading a file, listing a folder) need explicit permission from the user.  
The user grants permission to access a file (or folder) by selecting it from a file panel or dragging the path to the application.  
VisualDiffer prompts a file panel when it can't access a file due to a permission error; after the user selects it the path is stored as trusted so next time it isn't necessary to re-prompt.

[Using VisualDiffer as external diff tool with sandbox](#using_visualdiffer_as_external_diff_tool_with_sandbox)
=====================================================

Other applications can use VisualDiffer to compare files, for example, to compare a remote version of a file with its local version.

An application can save the remote version to a temporary file and then pass its full path to VisualDiffer. However, the path is not trusted, so VisualDiffer displays the file panel every time.

This behavior can be frustrating because you must select the file from the panel repeatedly.

[Use Trusted Paths](#use_trusted_paths)
=================

Trusted paths solve this problem because applications save files in their own temporary folders. For example, an application can generate the following path:

	/var/folders/mr/5dfd6w717cj5j374q24fdxsh0000gn/T/2PhpDQ_UnifiedDiff.m

Trusting this path works only once because the **5dfd6w717cj5j374q24fdxsh0000gn/T/** path component is generated randomly and changes every time.

Instead, you can trust **/var/folders**, the root directory used to save temporary files.

Trusting **/var/folders** ensures that paths generated anywhere inside it do not require additional permission, preventing further file panel prompts.

[Trust the File System from the Root (`/`)?](#trust_high_level)
=============================

Integrating VisualDiffer with [Finder](finder.html) through Services or Quick Actions can make the user experience even more frustrating. The items you want to compare can be located anywhere, either on the main disk or on external disks under `/Volumes/`, causing the file selection panel to appear repeatedly.

You may wonder, “I have just selected this path in Finder, so why am I being asked to open it?” This behavior is required by the sandbox. Finder and VisualDiffer are separate processes, and trusted paths cannot be transferred between them.

### [Workaround](#trusted_workaround)

⚠️ This workaround is not a complete solution. You can manually add a high-level directory, such as `/Volumes` or `/`, to Trusted Paths. Every path below that directory will then be accessible without requiring you to select it.

Use this workaround only if you understand that it grants VisualDiffer access to everything below the selected directory. VisualDiffer does not send or index data, and it performs file operations only when explicitly initiated by the user, so this approach can be considered “safe.”

[Where to configure Trusted Paths](#where_configure_trusted_paths)
=============================

You can add (drag&drop is supported) and/or remove paths manually from the VisualDiffer Preference panel.  
The paths colored in red no longer exist.
