---
permalink: finder.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: finder
title: OSX Finder Integration
subtitle: Launch VisualDiffer directly from OSX Finder
---

You can run VisualDiffer directly from OSX Finder, selecting two files or two folders

You don't need to run VisualDiffer then select items to compare, if you are on Finder do that from it

<div style="border: 1px dashed; padding:0 10px">
<h2>The OSX Finder integration requires a script not present on standard installation, you must download it from visualdiffer github's repository</h2>
<p>You can download the script <a href="https://github.com/visualdiffer/scripts">here</a></p>
</div>

# Compare with VisualDiffer

Add to Finder context menu (under Services) a new menu item to allow files and folders comparison.

## How to Install
- On Lion or above double click on "Compare with VisualDiffer.workflow" file
- On Snow Leopard you must copy manually the file `Compare with VisualDiffer.workflow` inside the directory `/Users/your account 
name/Library/Services`. If the directory `Services` doesn't exist you must create it

More details about installation are available <a href="https://github.com/visualdiffer/scripts/blob/master/installServices.md">here</a>

## How to Use

- When elements to compare are both visible on Finder window simply select the two files or folders and choose "Compare with VisualDiffer" 
from service menu
- When elements to compare are on different folders
	1. select first element from Finder and click on the service menu item
	2. browse to second element and again click on the service menu item
	3. the comparison will start
	
If you have more Finder windows visible first element can be selected using menu item from first window and second from another Finder window
