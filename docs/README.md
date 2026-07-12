# Writing with Typst

We propose hereafter a quick guide to help you write a document using **Typst**.

![Typst](typst.svg)

> [!NOTE]
> **Typst** uses a concise markup language inspired by **Markdown** to provide a wide range of formatting options.

## Text Formatting

* **Bold Text:** Surround your text with single asterisks `*bold*`.
* **Emphasis (Italics):** Surround your text with single underscores `_emphasis_`.
* **Headings:** Use equal signs `=` followed by a space at the beginning of a line. The number of `=` symbols determines the heading level _(e.g., `= Heading 1`, `== Heading 2`)_.

## Creating Lists

* **Unordered Lists:** Use a hyphen `-` followed by a space for each list item.
* **Ordered Lists:** Use a plus sign `+` followed by a space for each list item.

## Code Snippets

* **Inline Code:** Enclose the code within single backticks (\`).
* **Code Blocks:** Use triple backticks (\`\`\`) followed by the programming language to enable syntax highlighting.

````typ
```lang
Hello from lang!
```
````

## Inserting Objects

### Images

Use the following syntax to insert an image and reference it in the text:

```typ
#slide[
  #figure(
    image("IMAGE_NAME.EXT", width: 100%),
    caption: [IMAGE_CAPTION],
  ) <fig:LABEL>

  As seen in @fig:LABEL, the image is rendered beautifully.
]
```

### Tables

Use the following syntax to construct a table and reference it in the text:

```typ
#slide[
  #figure(
    table(
      columns: 4,
      [Row 1], [a], [b], [c],
      [Row 2], [1], [2], [3],
    ),
    caption: [Results],
  ) <tab:LABEL>

  @tab:LABEL displays some results.
]
```

## Bibliography

References are managed with a standard **BibTeX** `.bib` file and rendered by **Typst**'s built-in `#bibliography()` function.

1. Keep the entries in the `Bibliography.bib` file, using proper entry types _(`@article`, `@inproceedings`, `@book`, etc.)_:

    ```bibtex
    @article{cooley1965fft,
      author  = {Cooley, James W. and Tukey, John W.},
      title   = {An Algorithm for the Machine Calculation of Complex Fourier Series},
      journal = {Mathematics of Computation},
      year    = {1965},
      volume  = {19},
      pages   = {297--301},
    }
    ```

2. Cite a reference anywhere in the document with `@key`:

    ```typ
    The FFT reduces DFT complexity to O(n log n) @cooley1965fft.
    ```

> [!IMPORTANT]
> This project uses a **`justfile`** to standardize common tasks _(compiling, watching, cleaning build artifacts)_. Install [`just`](https://github.com/casey/just) once, then run commands from the project root instead of typing raw `typst` invocations by hand.
>
> ```sh
> just build        # compile the slides/document to PDF
> just watch        # live-recompile on save
> ```
