---
permalink: alignRules.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: alignRules
title: File Names Alignment Rules
subtitle: Change the default file names alignment method
---

Before files are compared they must be aligned; the alignment rule can be configured.

# [Align by Name Case Sensitivity](#align_by_name_case_sensitivity)

The default alignment method compares file name strings; if they match case-sensitively then they will be aligned.  
Suppose you have the scenario shown below

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Left</th>
                <th>Right</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>winter.jpg</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>WINTER.JPG</td>
            </tr>
            <tr>
                <td>summer.jpg</td>
                <td>summer.jpg</td>
            </tr>
        </tbody>
    </table>
</div>

By default, `winter.jpg` and `WINTER.JPG` will not be aligned because their strings don't match uppercase and lowercase characters.  
This result sometimes isn't what you expect; maybe you want to ignore uppercase/lowercase differences.  
This can be achieved by selecting 'Ignore File Name Case' from the popup menu.

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Left</th>
                <th>Right</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>winter.jpg</td>
                <td>WINTER.JPG</td>
            </tr>
            <tr>
                <td>summer.jpg</td>
                <td>summer.jpg</td>
            </tr>
        </tbody>
    </table>
</div>

# [Align by HFS+ Filesystem Case](#align_by_hfs_filesystem_case)

Normally the <acronym title="Hierarchical File System">HFS+</acronym> disks are formatted ignoring the file name case, so if we have `winter.jpg` and `WINTER.JPG` they cannot be created in the same directory (because they have the same name).

When the HFS+ partitions are formatted with case-sensitive support the file names `winter.jpg` and `WINTER.JPG` are two different file names and can be created in the same directory.

It is possible to let VisualDiffer determine the file name alignment case algorithm by looking at HFS partition case, so three scenarios are possible:

1. left and right are both case insensitive
2. left and right are both case sensitive
3. left/right is case sensitive and right/left is case insensitive

If the last scenario is true, the alignment will try to be smart: first it searches for a match case (`winter.jpg` with `winter.jpg`) then it tries to align with the most similar name.

# [Align by User Defined Rules](#align_by_user_defined_rules_required_macos_lion_or_above)

There are scenarios where it is necessary to align files having different names.  
The simplest scenario has files with the same name but different extensions as shown below

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Left</th>
                <th>Right</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001.jpg</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>001.raw</td>
            </tr>
            <tr>
                <td>002.jpg</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>002.RAW</td>
            </tr>
        </tbody>
    </table>
</div>

Suppose you want to align ignoring the file extension to produce the result shown below

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Left</th>
                <th>Right</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001.jpg</td>
                <td>001.raw</td>
            </tr>
            <tr>
                <td>002.jpg</td>
                <td>002.RAW</td>
            </tr>
        </tbody>
    </table>
</div>

This can be achieved using VisualDiffer 'user-defined alignment rules'.

## [Managing Alignment Rules](#managing_alignment_rules)

You can create, edit or delete rules from Session Preferences Dialog

![image]({{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/sessionPrefAlignment.png)

More rules can be assigned to a VisualDiffer session comparison; they are evaluated from top to bottom.

## [Creating a Rule](#creating_a_rule)

When you add a new rule (or edit an existing one) you access the dialog shown below

![image]({{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/alignRule.png) 

A rule has

- a left **regular** expression
- a right **pattern** expression

_If you are not familiar with regular expressions please refer to [ICU](https://userguide.icu-project.org/strings/regexp) documentation._

## [Left Regular Expression](#left_regular_expression)

The left regexp is used to match a filename on the left side of VisualDiffer Folder View; we want to find all jpg files so we create a group `(.*)` followed by the `.jpg` extension.

## [Right Pattern Expression](#right_pattern_expression)

Notice the right expression **isn't** a regular expression; it should contain some special patterns used to access regular expression groups (if any).

The right expression is used to match a file name on the right side of VisualDiffer Folder View; we want to match `.raw` files having the **same name** as the file on the left side.  
So we use the `$1` to get the first group present on the regexp (in this example there is only one group but you can have nine groups).

Now if you save the rule and then run the comparison you obtain the result shown below

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Left</th>
                <th>Right</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001.jpg</td>
                <td>001.raw</td>
            </tr>
            <tr>
                <td>002.jpg</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>002.RAW</td>
            </tr>
        </tbody>
    </table>
</div>

But `002.jpg` and `002.RAW` files are not aligned because the `002.RAW` extension is uppercase; this can be easily fixed by ignoring the case on the right expression as shown in the figure below

![image]({{ site.prefixDir }}img/ternaryop/vd/screenshots/wiki/alignRuleIgnoreCase.png)

## [Test Rule](#test_rule)

It is possible to verify immediately if the expressions work as expected using the 'Test Rule'; just type a file name and the 'Result' field will be filled accordingly.
