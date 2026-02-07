---
permalink: finder.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: finder
title: macOS Finder Integration
subtitle: Launch VisualDiffer directly from macOS Finder
---

You can run VisualDiffer directly from macOS Finder by selecting two files or two folders.  
You don't need to run VisualDiffer and then select items to compare; if you are in Finder you can do it from there.

# [Finder integration](#finder_integration_is_built_in)

Starting with VisualDiffer 2.1.4, Finder integration is built into the app, so you do not need to download the helper.  
**The helper is required only on macOS versions earlier than Ventura 13.x.**  
Even with the built-in integration, you must explicitly enable the Finder extension according to Apple's guidelines.

## [Enable the Finder extension](#enable_finder_extension)
1. Open VisualDiffer and go to Settings
2. In the Finder Integration section, click "Open System Settings to enable the VisualDiffer extension"
3. Enable the VisualDiffer Finder extension in System Settings

<img src="{{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/finderSettings.png" alt="VisualDiffer Settings with the Finder Integration entry" style="max-width: 720px; width: 100%; height: auto;">

## [How the Finder extension looks](#finder_extension_looks)

When the extension is enabled, Finder shows the VisualDiffer service in the context menu, with actions to select items for the left and right comparison panes.

<img src="{{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/finderMenu.png" alt="Finder context menu showing the VisualDiffer extension" style="max-width: 720px; width: 100%; height: auto;">

# [Compare with VisualDiffer](#compare_with_visualdiffer)

Add to the Finder context menu (under Services) a new menu item to allow file and folder comparison.

## [Install helper on macOS earlier than Ventura 13.x](#install_helper_pre_ventura)

**The helper is required only on macOS versions earlier than Ventura 13.x.** On Ventura 13.x or later, do not install the helper.

<div class="finder-callout" role="note" aria-label="Finder integration download">
  <div class="finder-callout__header">
    <div class="finder-callout__icon">
      <i class="fa-solid fa-download" aria-hidden="true"></i>
    </div>
    <h2 class="finder-callout__title">Download the Finder helper before you start</h2>
  </div>
  <p class="finder-callout__text">The Finder integration relies on a helper script that is not bundled with VisualDiffer. Grab it from the VisualDiffer GitHub repository <a href="https://github.com/visualdiffer/scripts">here</a>.</p>
</div>

- On Lion or above double-click the "Compare with VisualDiffer.workflow" file
- On Snow Leopard you must manually copy the file `Compare with VisualDiffer.workflow` inside the directory `/Users/your account 
name/Library/Services`. If the directory `Services` doesn't exist you must create it.

More details about installation are available <a href="https://github.com/visualdiffer/scripts/blob/master/installServices.md">here</a>.

## [How to Use](#how_to_use)

### [Finder extension (Ventura 13.x or later)](#finder_extension_use)

- In Finder, right-click the first file or folder and choose `Select <name> on Left` or `Select <name> on Right`
- Right-click the second item (it can be in another Finder window or tab), then choose `Compare <name1> with <name2>`
- The comparison starts automatically; if required by the Apple sandbox, you may be asked to select the files

### [Helper (macOS earlier than Ventura 13.x)](#helper_use)

- When elements to compare are both visible in a Finder window, simply select the two files or folders and choose "Compare with VisualDiffer" 
from the Services menu
- When elements to compare are in different folders
	1. Select the first element from Finder and click on the service menu item
	2. Browse to the second element and again click on the service menu item
	3. The comparison will start

If you have more Finder windows visible the first element can be selected using the menu item from one window and the second from another Finder window.
