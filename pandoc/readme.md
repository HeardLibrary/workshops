# Pandoc

[Pandoc](http://pandoc.org/) is a wonderful tool for converting between multiple file formats. In this tutorial, we'll learn the basics of pandoc for implementing a minimalist writing workflow. 

## Installation

You can try [Pandoc online](http://pandoc.org/try/) without any installation. But you really need to install it to make full use of its features. See the [instructions for installing Pandoc](http://pandoc.org/installing.html) on Mac and Windows at the Pandoc website.

## First Steps

Let's follow the tutorial titled [Getting Started](http://pandoc.org/getting-started.html) at the Pandoc website to become acquainted with its basic functionality.

## Exercise

Let's try to convert this simple document in TEI (both standalone and as a fragment), MediaWiki, HTML, and ePub.

```md
# Minimalist Writing

I'd like to make three points in this lesson:

* We should stop writing in Word
* We should start writing in markdown
* We should use pandoc to convert from markdown to Word and PDF
```

### Adding Citations

[pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) is a filter for pandoc that allows you to incorporate references into your documents and to use one of [hundreds of CSL styles](https://github.com/citation-style-language/styles) to format them appropriately. 

### Adding a Word Template

It's possible to control how Pandoc converts your documents into Word by making reference to a Word template with the `--reference` filter.

## Converting to PDF

If you want to convert a document to PDF, you'll need to install a Latex engine on your machine. You can also tweak the PDF conversion by adding custom LaTeX fields to your document.
