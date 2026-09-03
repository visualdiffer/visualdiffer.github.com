---
permalink: prerelease.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: prerelease
title: How to Install a Pre-Release
subtitle: Try alpha and beta builds before they become stable
---

Pre-releases are early builds of VisualDiffer, published to test new features and bug fixes before they reach a stable version.
They are signed and notarized by Apple like every other release, but they may still contain bugs.

[Install](#install)
===================

1. Open the [releases page](https://github.com/visualdiffer/visualdiffer/releases) and look for a build marked **Pre-release**; its version number ends with `alpha` or `beta`.
2. Download the `VisualDiffer-<version>.zip` file from the **Assets** section of that release.
3. Unzip it wherever you want, there is no need to copy it to the `Applications` folder.
4. There is no need to uninstall the version you already have.
5. Launch it and try it.
6. Once you are done, you can delete it.

[Good to know](#good_to_know)
=============================

* macOS asks you to confirm the first launch because the app was downloaded from the internet. No security warning is shown, the app is notarized by Apple.
* A pre-release is never listed as the **Latest** release and is never offered by the in-app update check, so the version you already have installed keeps updating to stable releases only.
* A pre-release does not check for updates on its own: to get a newer build, come back to the releases page and download it again.

[Report a problem](#report_a_problem)
=====================================

If something goes wrong, open an issue on [GitHub](https://github.com/visualdiffer/visualdiffer/issues) and include the version number shown in the About window.
