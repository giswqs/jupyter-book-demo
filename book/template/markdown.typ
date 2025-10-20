
/* Written by MyST v1.6.3 */

Whether you write your book's content in Jupyter Notebooks (`.ipynb`) or in regular markdown files (`.md`), you'll write in the same flavor of markdown called *MyST Markdown*.

= What is MyST? <what-is-myst>

MyST stands for "Markedly Structured Text". It is a slight variation on a flavor of markdown called "CommonMark" markdown, with small syntax extensions to allow you to write *roles* and *directives* in the Sphinx ecosystem.

= What are roles and directives? <what-are-roles-and-directives>

Roles and directives are two of the most powerful tools in Jupyter Book. They are kind of like functions, but written in a markup language. They both serve a similar purpose, but *roles are written in one line*, whereas *directives span many lines*. They both accept different kinds of inputs, and what they do with those inputs depends on the specific role or directive that is being called.

== Using a directive <using-a-directive>

At its simplest, you can insert a directive into your book's content like so:

````
```{mydirectivename}
My directive content
```
````

This will only work if a directive with name `mydirectivename` already exists (which it doesn't). There are many pre-defined directives associated with Jupyter Book. For example, to insert a note box into your content, you can use the following directive:

````
```{note}
Here is a note
```
````

In your built book.

For more information on writing directives, see the #link("https://myst-parser.readthedocs.io/")[MyST documentation].

== Using a role <using-a-role>

Roles are very similar to directives, but they are less-complex and written entirely on one line. You can insert a role into your book's content with this pattern:

```
Some content {rolename}`and here is my role's content!`
```

Again, roles will only work if `rolename` is a valid role's name. For example, the `doc` role can be used to refer to another page in your book. You can refer directly to another page by its relative path.

For more information on writing roles, see the #link("https://myst-parser.readthedocs.io/")[MyST documentation].

== Adding a figure <adding-a-figure>

You can also add figures to your book.

```text
:::{figure} https://assets.gishub.org/images/book-cover.png
:label: gispro-book-cover
:alt: GISPro Book Cover
:align: center
:width: 100%

GIS Programming with Python Book Cover.
:::
```

== Adding a citation <adding-a-citation>
