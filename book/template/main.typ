#import "lib.typ": annexes, appendices, blockquote, book, horizontalrule, hr, note

// #import "@preview/min-book:1.0.0": (
//   book, note, horizontalrule, hr, blockquote, appendices, annexes
// )

// --- Front Cover ---
// #set page(width: 8in, height: 10in, margin: 0pt, background: image("assets/front-cover.png", width: 100%, height: 100%))

#pagebreak()

// --- Reset page style after cover ---
#set page(
  width: 8in,
  height: 10in,
  margin: (x: 0.75in, y: 0.75in),
  background: none,
)

// Display inline code in a small box
// that retains the correct baseline.
#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// Display block code in a larger block
// with more padding - REMOVED left indentation
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)

// Style hyperlinks with color
// #show link: set text(fill: rgb("#005198"))
#show link: set text(fill: blue)

// Remove the problematic heading show rule - the numbering style fix should be enough

#show outline: it => {
  set page(numbering: "i")
  counter(page).update(1)
  it
}

#pagebreak()

#show: book.with(
  title: "Open Publishing Fundamentals",
  subtitle: "Using Jupyter Book to Write and Publish a Book",
  authors: "Qiusheng Wu",
  date: (2025, 10, 20),
  cover: none,
  cfg: (
    // page-cfg: "us-letter",
    page-cfg: (
      width: 8in,
      height: 10in,
      //       margin: (
      //         top: 0.75in,
      //         bottom: 0.75in,
      //         inside: 1in,   // left side of odd pages, right side of even pages
      //         outside: 0.75in
      //       )
    ),
    margin: (x: 0.75in, y: 0.75in),
    font: "Alice",
    font-size: 11pt,
    first-line-indent: 0em,
    par-margin: 1em,
    toc-indent: 1em,
    // Use default fonts to avoid warnings - remove font specification to use system defaults
    // Modified numbering style to remove line breaks for single-line headings
    numbering-style: (
      "{1:I}: ",
      "{2:1}. ",
      "{2:1}.{3:1}. ",
      "{2:1}.{3:1}.{4:1}. ",
      "{2:1}.{3:1}.{4:1}.{5:1}. ",
      "{2:1}.{3:1}.{4:1}.{5:1}.{6:a}. ",
    ),
  ),
)

#let original-image = image
#let image(..args) = {
  // Get all arguments
  let pos-args = args.pos()
  let named-args = args.named()

  // Override width to 100%
  named-args.width = 100%

  // Call original image function with modified args
  original-image(..pos-args, ..named-args)
}

// #heading(level: 1, numbering: none)[Preface]

// // Override the library's code block padding to remove left indentation
#show raw.where(block: true): it => {
  // Apply the same styling as the library but without left padding
  block(
    fill: luma(240),
    inset: 0pt,
    radius: 4pt,
    width: 100%,
    it,
  )
}

// #include "preface.typ"

= Open Publishing Fundamentals

#include "introduction.typ"
#include "markdown.typ"


// --- Back Cover ---
#pagebreak()
// #set page(width: 8in, height: 10in, margin: 0pt, background: image("assets/back-cover.png", width: 100%, height: 100%))
