# AsciiDoc Book Starter

[![book-generate-pdf](https://github.com/lirantal/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml/badge.svg?branch=main)](https://github.com/lirantal/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml)

This is a template repository for authoring books using AsciiDoc.

I've briefly explored other formats such as Markdown, Latex, and Pandoc but I've found AsciiDoc to be the most flexible and powerful format for authoring books. It is easily readable and writable to a human, has a lax syntax and a good set of defaults for authoring books, and can be easily converted to other formats such as PDF, ePUB and HTML.

AsciiDoc is also a very powerful format for authoring technical documentation and is widely used in the media and content publishing industry, such as in O'Reilly's books.

## Getting Started

- Initialize Git LFS

```sh
cp .gitattributes-example .gitattributes
```

## Basics of AsciiDoc and Writing

An important observation to get started when authoring a book with AsciiDoc is the notion of the language vs the implementations. AsciiDoc is a language that's intended to be a lightweight semantic markup. To generate output from AsciiDoc we use text processor tools such as [Asciidoctor](https://asciidoctor.org/), which is free and open source.

Get up to date with the latest AsciiDoc syntax and features by reading the [AsciiDoc User Guide](https://asciidoctor.org/docs/asciidoc-writers-guide/).

## Features

Book authoring experience provides the following features with this repository:

- Table of Contents (TOC) generation.
- Template prelude chapters: A `Preface`, and a `Forward`.
- Template chapters with commonly used formatting in books.
- Chapters are structured into their own chapter directories so they can be co-located with their images and other assets, such as code snippets.
- A PDF output that uses a theme, and can be customized.
- A PDF output that uses custom fonts (Google's open fonts family). Specifically, an [Open Sans](https://fonts.google.com/specimen/Open+Sans) font for the body text, and a [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro) font for source code snippets and inline code.

Book generation:

- No need for a local installation of Asciidoctor, as the book generation is done via Docker.
- No need for a special CI setup, as the book generation is done via Docker.
- Docker-based scripts to generate the book in various formats, including PDF, HTML and ePUB.

## Getting Started with AsciiDoc Book Starter

We start by getting familiar with the repository structure and the various files that are part of it.

The top-level directory structure looks like this:

```text
.
├── README.md
├── book
│   ├── preface.adoc
│   ├── foreword.adoc
│   ├── index.adoc
│   ├── chapter-01-The-Beginning
│   │   ├── content.adoc
│   ├── chapter-02-The-Rocket
│   │   ├── content.adoc
│   ├── chapter-03-How-Planet-Systems-Work
│   │   ├── content.adoc
│   │   └── images
│   ├── fonts/
│   ├── images/
│   └── themes/
├── create-book-epub.sh
├── create-book-pdf.sh
└── interactive-asciidoctor-shell.sh
```

The `book` directory is where the book content is stored:

- The `index.adoc` file is the main entry point for the book, and it's where we include all the other chapters and prelude chapters.
- The `images/` directory is where you can store images that are used in the book.
- Chapters are written in their specific directory, and each chapter directory contains a file, named `content.adoc`, which is the main entry point for the chapter, and an optional `images` directory for images that are used in the chapter. This helps to colocate assets for the same chapter together rather than having them all mixed into one big directory.
- In the same directory, you'll find the theme-able PDF `themes` directory and the `fonts` directory which contains the fonts used in the book.

## Generate the AsciiDoc book

### Building the AsciiDoc book locally

To build the book locally, you'll need to have Docker installed on your machine. Once you have Docker installed, you can run the following command to build the book in PDF format:

```bash
./create-book-pdf.sh basic
```

Or, generate a dark-mode themed PDF book:

```bash
./create-book-pdf.sh dark
```

Then you can find the generated PDF file in the `book` directory. If you're on a macOS, you can open it with your default PDF reader as follows:

```bash
open book/index.pdf
```

### Helpful AsciiDoc Scripts

The asciidoc book starter repository also provides a few helpful scripts to help you generate other book output formats and debug the asciidoctor tool:

- `create-book-ePUB.sh` - Generates the book in ePUB format.
- `interactive-asciidoctor-shell.sh` - Starts an interactive shell inside the Docker image with the `asciidoctor` tool installed.

## AsciiDoc Book Assets

Static assets for the book are stored in the `book` directory, and include the following:

- The `images` directory is where you can store images that are used in the book. Inside this directory is a `cover.jpeg` image used for the book's cover, and a `space.jpeg` used as an example for an image in the book.
- The `fonts` directory is where you can store fonts that are used in the book. It currently houses the [Open Sans](https://fonts.google.com/specimen/Open+Sans) and [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro) fonts, both with their original `.zip` file archived as downloaded from the Google Fonts website as well as extracted into its individual directory.

## Pre-Commit Hooks

- See: [pre-commit](https://pre-commit.com/)
  - [pre-commit/pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks)

### Install

#### Local Install (macOS)

- **IMPORTANT**: All developers committing any code to this repo, should have these pre-commit hooks installed locally. Github actions may also run these at some point, but it is generally faster and easier to run them locally, in most cases.

- The `brew` step that installs the tools will be different on other operating systems, but the rest of the steps should generally be the same.

```sh
brew install pre-commit shellcheck shfmt git-secrets jq

mkdir -p ${HOME}/.git-template/hooks
git config --global init.templateDir ${HOME}/.git-template
```

#### Local Install (Windows)

Prerequisites- [python](https://www.python.org/downloads/), [Chocolatey](https://chocolatey.org/install)

- Use `pip` to install `pre-commit`

```sh
pip install pre-commit
```

- Use chocolatey to install the following packages
  - Open Powershell as administrator

```powershell
choco install shellcheck shfmt jq
```

- Install `git-secrets` by cloning the [repo](https://github.com/awslabs/git-secrets.git) and running a powershell script

```powershell
git clone https://github.com/awslabs/git-secrets.git
.\install.ps1
```

#### Test installation

- Close and reopen your terminal
- Make sure that you run these commands from the root of this git repo!

```sh
pre-commit init-templatedir -t pre-commit ${HOME}/.git-template
pre-commit install
```

- Test it

```sh
pre-commit run -a
git diff
```

### Checks

See:

- [.pre-commit-config.yaml](./.pre-commit-config.yaml)

#### Configuring Hooks

- [.pre-commit-config.yaml](./.pre-commit-config.yaml)
- [yamllint-config.yaml](./.yamllint-config.yaml)

## Author

Original version by: Liran Tal <liran@lirantal.com>
Fork maintained by: Sean P. Kane <spkane@techlabs.sh>
