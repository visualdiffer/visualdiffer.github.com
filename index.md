---
permalink: index.html
layout: default
title: Wiki Main Page
noToc: true
---

Table of Contents
=================

* [Folder Colors Legend](foldersLegend.html)
* [File Colors Legend](fileLegend.html)
* [Comparison Methods](comparisonMethods.html)
* [Integrate with other macOS applications](externalApps.html)
* [Trusted Paths](trustedPaths.html)
* [Alignment Rules](alignRules.html)

Extra Features
==============

* [Unix Shell Scripting Support](unixshell.html)
* [Frequently Asked Questions](faq.html)
* [Integrate with macOS Finder context menu](finder.html)


Other sites
===========

{% for link in site.common_links %}
* [{{link.title}}]({{link.link}}){% endfor %}
