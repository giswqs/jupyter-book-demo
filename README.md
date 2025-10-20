# Jupyter Book Demo

This is a Jupyter book demo

## Usage

### Using the Template

Click the "Use this template" button to create a new repository from this template. Give your new repository a name and click the "Create repository" button to create your new repository.

### Building the book

Follow the steps below to build the book.

1. Clone your new repository or click the "Code" button and download the repository as a ZIP file.
2. Unzip the repository if you downloaded it as a ZIP file. Navigate to the repository in your terminal.
3. Run `pip install -r requirements.txt` (it is recommended you do this within a virtual environment)
4. (Optional) Edit the books source files located in the `book/` directory
5. Run `jupyter-book clean .` to remove any existing builds
6. Run `jupyter-book build .` to build the book
7. The fully-rendered HTML version of the book will be built in `_build/html/`. Open the `index.html` file in your browser to view the book.

### Setup and Environment

### IDE Recommendations

To edit the book, you will need an IDE. You can use any IDE you like, but I recommend using VS Code. You can download it [here](https://code.visualstudio.com/).

#### Setup Instructions

You will need Python to build the book. It is recommended to use uv to manage the Python environment. Follow the instructions [here](https://docs.astral.sh/uv/getting-started/installation/#installing-uv) to install uv. Once uv is installed, you can create and activate a new environment with the following commands:

```bash
# Navigate to your project directory
cd /path/to/your/project

# Create a virtual environment
uv venv --python 3.12

# Activate the environment (varies by OS)
# On macOS/Linux:
source .venv/bin/activate
# On Windows:
.venv\Scripts\activate
```

To install dependencies, run the following commands:

```bash
uv pip install pip
uv pip install -r requirements.txt
```

#### Building the book

```bash
uv run jupyter-book build .
uv run myst build --typst --pdf --docx
```

#### Page Frontmatter

```yaml
---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.18.1
title: Introduction to Open Publishing
subtitle: Using Jupyter Book for Open Publishing
authors:
  - name: Qiusheng Wu
    affiliations:
      - University of Tennessee
    orcid: 0000-0001-5437-4073
    email: qwu18@utk.edu
license: CC-BY-4.0
abstract: |
  This tutorial introduces open publishing techniques using Jupyter Book and demonstrates how to effectively publish your research.
exports:
  - format: docx
  - format: pdf
  - format: typst
    template: lapreprint-typst
---
```

#### Removing Margin

Open `_build/templates/typst/myst/lapreprint-typst/lapreprint.typ` in your text editor and remove the following lines:

- Line 83, change ` margin: (left: 25%)` to ` margin: (left: 1in)`
- On Lines 253-254, comment out the following lines:

```text
//               text(size: 7pt, fill: theme, weight: weight, d.title),
//               text(size: 7pt, d.date.display("[month repr:short] [day], [year]"))
```

#### Adding Citations

To cite using DOI:

```
Change (Smith et al., 2020) to [](https://doi.org/10.XXXX/XXXXX)
```

To cite using BibTeX:

```
{cite:p}`myst2023,jupyterbook2021`
```

#### Figures and Images

Basic figure:

```
:::{figure} ./images/map.png
:label: my-map-figure
:alt: GIS map showing population density
:align: center

Map showing population density in the study area.
:::
```

Remote image with alignment:

```
:::{figure} https://example.com/path/to/image.png
:align: right
:width: 40%

Caption for the figure.
:::
```

#### Cross-references

Reference a figure:

```
See [](#my-map-figure) for the spatial distribution.
```

### Interactive Documents

#### Adding Code Cells

In a Markdown file:

````
```{code-cell}
:label: simple-map
import geopandas as gpd
import matplotlib.pyplot as plt

# Load example data
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))

# Plot
fig, ax = plt.subplots(figsize=(10, 6))
world.plot(ax=ax)
plt.title('World Map')
plt.axis('off')
````

#### Adding Labels to Code Cells

In notebooks:

```python
#| label: population-map
import geopandas as gpd
world = gpd.read_file(gpd.datasets.get_path('naturalearth_lowres'))
world.plot(column='pop_est', legend=True)
```

Then reference:

```
See the population distribution map in [](#population-map).
```

#### Executing Notebooks

Make sure to add this to frontmatter:

```yaml
kernelspec:
  name: python3
  display_name: Python 3
```

Then run:

```bash
myst start --execute
```

#### Interactive Elements

Create a dropdown:

```
:::{note} Solution to Exercise 1
:class: dropdown
Here we see that the spatial autocorrelation is positive with a Moran's I value of 0.68.
:::
```

### Publishing and Distribution

#### Exporting to Various Formats

For Word documents:

```yaml
---
exports:
  - format: docx
---
```

For PDF:

```yaml
---
exports:
  - format: pdf
    template: volcanica
    article_type: Report
---
```

For LaTeX:

```yaml
---
exports:
  - format: tex
    template: volcanica
    article_type: Report
    output: arxiv.zip
---
```

Build command:

```bash
myst build your_document.md
```

#### Deploying to GitHub Pages

1. Run `myst init --gh-pages`
2. Modify workflow file:

```yaml
jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup Pages
        uses: actions/configure-pages@v3
      - uses: actions/setup-node@v4
        with:
          node-version: 18.x
      - name: Install MyST Markdown
        run: |
          npm install -g mystmd
          pip install -r requirements.txt
          pip install ipykernel
          python -m ipykernel install --user
      - name: Build HTML Assets
        run: myst build --html --execute
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: "./_build/html"
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

3. Create a new GitHub repository
4. Push your content
5. Enable GitHub Pages in repository settings

#### Managing Table of Contents

Update TOC:

```bash
myst init --write-toc
```

Customize TOC:

```yaml
toc:
  - file: README.md
  - file: 01-introduction.md
  - title: Geospatial Analysis
    children:
      - file: chapters/spatial-data.ipynb
      - file: chapters/visualization.ipynb
```

Enable section numbering:

```yaml
project:
  numbering:
    heading_1: true
    heading_2: true
```

## Credits

This project is created using the excellent open source [Jupyter Book project](https://jupyterbook.org/) and the [executablebooks/cookiecutter-jupyter-book template](https://github.com/executablebooks/cookiecutter-jupyter-book).
