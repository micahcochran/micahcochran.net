---
title: "scrape-schema-recipe Library"
tags: python, recipe, schema-org, schema, library
---
## scrape-schema-recipe

[scrape-schema-recipe](https://github.com/micahcochran/scrape-schema-recipe) is a Python library that scrapes recipes from websites.  Those recipes are structured using the [schema.org/Recipe format](http://schema.org/Recipe/).  It returns that representation as a list of dictionaries.


Below is a screenshot of a [recipe for Chicken and Black Bean Salsa Burritos](https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/) on the MedlinePlus website:
![Image of recipe](/assets/img/ssr-medlineplus.png "Screenshot of recipe for 'Chicken and Black Bean Salsa Burritos' on MedlinePlus website.")


Below is what that structured data from the above recipe looks in a Python dictionary (very similar to a JSON representation):
![Image of schema.org/Recipe data](/assets/img/ssr-dict-recipe.png "Python Dictionary of 'Chicken and Black Bean Salsa Burritos'")

Here's code to print the above in Python:
```python
from scrape_schema_recipe import scrape_url
import pprint

url = "https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/"
results = scrape_url(url)
recipe = results[0]
pprint.pprint(recipe)
```

The library scrapes the source and places it into a dictionary.  There are arguments within the library to will convert the some data into python objects, so dates into `datetime.date` objects, and durations (like "Cook Time: 30 minutes") into `datetime.timedelta` objects. Depending on the project, those might be a nice to use. 


Since schema.org/Recipe data is structured, this allows for frontend web developers to develop their website based on a standard set of microdata that they can reuse on other projects.  That structured data can be used by other software and websites that want to read or copy that recipe.

schema.org/Recipe specification, which has multiple properties that makeup the structure:
![picture of the website schema.org/Recipe specification](/assets/img/ssr-schema-org-recipe.png "schema.org/Recipe specification, which has multiple properties that makeup the structure.") 


The library scrapes the recipe and returns a list of dictionaries.  This is list because a website could have multiple recipes on a webpage, but most webpages only have one recipe on a page.

Example data is provided for application development by the fuction `example_output()`, feed in value from example_name as the first parameter `name=`.  The examples are in locally HTML data.
