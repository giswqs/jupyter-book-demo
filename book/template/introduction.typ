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
