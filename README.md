# Installation

### Prerequisites

    bundle install
    npm install

### Tailwind

Generate the `CSS` every time styles on `input.css` change

    npx @tailwindcss/cli -i ./css/input.css -o css/theme.css

# Local Test

### Generate documentation for the Apple Help system

	./jekyllapple.sh

### Run the site

	bundle exec jekyll serve --watch

# Deploy

The site is hosted on [GitHub Pages](https://pages.github.com/). Pushing to the `main` branch triggers an automatic deployment — no manual steps required.
