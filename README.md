# Installation

### Prerequisites

    bundle install
    npm install

### Tailwind

Regenerate the CSS whenever `input.css` changes.

    npx @tailwindcss/cli -i ./css/input.css -o css/theme.css

### Images

Reduce image size

    find img/screenshots -type file -name '*.png' -exec pngquant -f --ext .png --quality=65-80 {} \;

# Highlight rectangle

See [contextMenuExclude.png](img/screenshots/folder/fileFilters/contextMenuExclude.png) or [traverseFileFilters.png](img/screenshots/folder/fileFilters/traverseFileFilters.png)

To highlight a region in GIMP:

1. Use the Ellipse/Rectangle Select Tool
2. Select the area you want to keep
3. Select → Feather — e.g., 30–50px for soft edges
4. Invert the selection — `Select → Invert`
5. Darken the surrounding area — `Colors → Brightness-Contrast`, set Brightness to -127

# Local Test

### Generate documentation for the Apple Help system

	./jekyllapple.sh

### Run the site

	bundle exec jekyll serve --watch

# Deploy

The site is hosted on [GitHub Pages](https://pages.github.com/). Pushing to the `main` branch triggers an automatic deployment — no manual steps required.
