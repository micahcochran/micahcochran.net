---
title: "scrape-schema-recipe Library"
date: 2021-07-30 18:22:33
tags:
    - Python
    - schema-org
    - schema
    - library
    - unit testing
categories:
    - projects
---
[scrape-schema-recipe](https://github.com/micahcochran/scrape-schema-recipe) is a Python library that scrapes recipes from websites and HTML files.  Those recipes are structured using the [schema.org/Recipe format](http://schema.org/Recipe/).  It returns that representation as a list of dictionaries (there could be multiple recipes on a webpage such as a cookbook).


Below is a screenshot of a [recipe for Chicken and Black Bean Salsa Burritos](https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/) on the MedlinePlus website:
![Image of recipe](/images/ssr/ssr-medlineplus.webp "Screenshot of recipe for 'Chicken and Black Bean Salsa Burritos' on MedlinePlus website.")


Below is what that structured data from the above recipe looks in a Python dictionary (very similar to a JSON representation):
![Image of schema.org/Recipe data](/images/ssr/ssr-dict-recipe.webp "Python Dictionary of 'Chicken and Black Bean Salsa Burritos'")

Here's the Python code to print the above:
<pre><code class="python-html">
from scrape_schema_recipe import scrape_url
import pprint

url = "https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/"
results = scrape_url(url)
recipe = results[0]
pprint.pprint(recipe)
</code></pre>

This library scrapes the source and gives the results at a list of dictionaries.  The code can convert the some data into native Python objects, so dates into `datetime.date` objects, and durations (like "Cook Time: 30 minutes") into `datetime.timedelta` objects (`datetime.timedelta(seconds=1800)` - minutes are not a unit used by timedelta). Other software can use this to scrape this recipe information from a URL or an HTML file.

Since schema.org/Recipe data is structured, this allows a pattern that frontend and backend web developers to have a standard way to structure recipe data on any projects.  That structured data can be used by other software for copying that recipe or doing something else with it that recipe (software doing nutrition calculations or checking if it meets a specific diet).

schema.org/Recipe specification, which has multiple properties that makeup the structure:
![picture of the website schema.org/Recipe specification](/images/ssr/ssr-schema-org-recipe.webp "schema.org/Recipe specification, which has multiple properties that makeup the structure.") 

This project has unit testing to ensure that any future changes do not break existing functionality.

This library is hosted on [pypi](https://pypi.org/project/scrape-schema-recipe/) for anyone to be able to install via the `pip` with the command `pip install scrape-schema-recipe`.


<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
<script>hljs.highlightAll();</script>