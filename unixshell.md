---
permalink: unixshell.html
layout: default

# mainAnchor is used by Apple links
mainAnchor: unixShell
title: visdiff
subtitle: Command-line tool for launching VisualDiffer from the terminal
---

`visdiff` is a command-line tool bundled with VisualDiffer. It opens a comparison directly from the terminal without having to launch the app manually.

The executable is located at:

    /Applications/VisualDiffer.app/Contents/Helpers/visdiff

# [Usage](#usage)

    visdiff [options] <left file or folder> <right file or folder>

Left and right must both be files or both be folders.

# [Options](#options)

<div class="table-wrapper">
    <table class="alt">
        <thead>
            <tr>
                <th>Option</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><code>--wait</code></td>
                <td>Block the terminal until the diff window is closed.
                    Useful when calling visdiff from a script or editor that needs to wait
                    for the comparison to finish before continuing.</td>
            </tr>
            <tr>
                <td><code>--focus</code></td>
                <td>After the diff window is closed, return focus to the application that
                    launched visdiff (for example, your terminal or editor).
                    <strong>Only effective when used together with <code>--wait</code>.</strong></td>
            </tr>
            <tr>
                <td><code>--no-warning</code></td>
                <td>Suppress the sandbox warning printed to stderr on every run.
                    Useful in scripts where the warning would pollute the output.</td>
            </tr>
            <tr>
                <td><code>--version</code></td>
                <td>Print the visdiff version and exit.</td>
            </tr>
        </tbody>
    </table>
</div>

## [Using --wait and --focus together](#wait_and_focus)

`--focus` without `--wait` has no effect. The typical use case is integrating visdiff with an editor or script that needs to:

1. open a diff,
2. wait for the user to close it, and
3. regain focus automatically when the diff window is closed.

{% highlight bash %}
$ visdiff --wait --focus ~/original.txt ~/modified.txt
{% endhighlight %}

Without `--focus`, VisualDiffer keeps focus after the window closes. With `--focus`, focus returns to the calling application.

# [Creating a Symbolic Link](#creating_a_symbolic_link)

VisualDiffer does not install `visdiff` into a system path automatically (Apple's App Store guidelines do not allow it). You can create the link manually:

{% highlight bash %}
$ sudo ln -s /Applications/VisualDiffer.app/Contents/Helpers/visdiff /usr/local/bin/visdiff
{% endhighlight %}

# [Sandbox and Trusted Paths](#macos_sandbox_temporary_files_and_annoying_file_open_panel_prompts)

`visdiff` runs inside the macOS sandbox. The first time it tries to open a path it has not seen before, VisualDiffer may prompt you to confirm access. To avoid repeated prompts, add the relevant paths in **Settings → Trusted Paths**. See [Trusted Paths](trustedPaths.html) for details.

The sandbox also prints a reminder to stderr on every run. Pass `--no-warning` to silence it once you have set up your trusted paths.

# [How visdiff Resolves Relative Paths](#relative_paths)

Because `visdiff` is sandboxed, it cannot read the shell's current working directory directly. Relative paths are resolved against the sandbox container, not against `$PWD`, which means they will likely fail.

The fix is to prepend `$PWD` to make the path absolute before passing it to visdiff:

Instead of:

{% highlight bash %}
$ visdiff ../myfile.txt ~/reference.txt
{% endhighlight %}

Use:

{% highlight bash %}
$ visdiff $PWD/../myfile.txt ~/reference.txt
{% endhighlight %}
