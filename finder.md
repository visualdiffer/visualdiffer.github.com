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

<div class="finder-callout" role="note" aria-label="Finder integration download">
  <div class="finder-callout__header">
    <div class="finder-callout__icon">
      <i class="fa-solid fa-download" aria-hidden="true"></i>
    </div>
    <h2 class="finder-callout__title">Download the Finder helper before you start</h2>
  </div>
  <p class="finder-callout__text">The Finder integration relies on a helper script that is not bundled with VisualDiffer. Grab it from the VisualDiffer GitHub repository <a href="https://github.com/visualdiffer/scripts">here</a>.</p>
</div>

# [Compare with VisualDiffer](#compare_with_visualdiffer)

Add to the Finder context menu (under Services) a new menu item to allow file and folder comparison.

## [How to Install](#how_to_install)
- On Lion or above double-click the "Compare with VisualDiffer.workflow" file
- On Snow Leopard you must manually copy the file `Compare with VisualDiffer.workflow` inside the directory `/Users/your account 
name/Library/Services`. If the directory `Services` doesn't exist you must create it.

More details about installation are available <a href="https://github.com/visualdiffer/scripts/blob/master/installServices.md">here</a>.

## [How to Use](#how_to_use)

- When elements to compare are both visible in a Finder window, simply select the two files or folders and choose "Compare with VisualDiffer" 
from the Services menu
- When elements to compare are in different folders
	1. Select the first element from Finder and click on the service menu item
	2. Browse to the second element and again click on the service menu item
	3. The comparison will start
	
If you have more Finder windows visible the first element can be selected using the menu item from one window and the second from another Finder window.
