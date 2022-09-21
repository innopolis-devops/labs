# PureScript time app

## Overview

When a `parcel` dev server starts, one can open a given address in a browser to see current time in Moscow (MSK). The page will automatically refresh each 0.8 seconds.

![demo](README/demo.png)

## Best practices

- Automatically generated the project via [spago](https://github.com/purescript/spago), an official `PureScript` package manager

- Used linters and formatters (available in VSCodium)

- I adapted An HTML [template](https://www.freecodecamp.org/news/html-starter-template-a-basic-html5-boilerplate-for-index-html/). There is an explanation of why specific tags vere included.

## Chosen framework

[Halogen](https://github.com/purescript-halogen/purescript-halogen)

### Pros

- Type-safe -> Fewer bugs
- Declarative
- Component Architecture
- Fast to code
- Written entirely in PureScript
- Robust

### Cons

- Not easy to learn by following the [guide](https://purescript-halogen.github.io/purescript-halogen/index.html)
- Maintained by only a few persons -> vulnerable

## Linters, checkers, formatters

### PureScript

- [purs-tidy](https://github.com/natefaubion/purescript-tidy) - a formatter
- [purescript](https://github.com/purescript/purescript) - `PureScript` compiler. No need for linter as it's a strongly statically typed language

### Markdown

- [markdownlint](https://github.com/DavidAnson/markdownlint)

### HTML

- [djlint](https://www.djlint.com/) - an `HTML` linter
