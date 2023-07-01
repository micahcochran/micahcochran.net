---
title: "scrape-schema-recipe Library"
date: 2021-07-30 18:22:33
update: 2023-05-28 08:13:00
tags:
    - Python
    - schema-org
    - schema
    - library
    - unit testing
categories:
    - projects
---
[scrape-schema-recipe](https://github.com/micahcochran/scrape-schema-recipe) is a Python library that scrapes recipes from websites and HTML files.  Those recipes are structured microdata using the [schema.org/Recipe format](http://schema.org/Recipe/).  It returns that representation as a list of dictionaries (since there could be multiple recipes on a webpage such as a cookbook).


<figure>
    <img src="/images/ssr/ssr-medlineplus.webp">
    <figcaption>Screenshot of a <a href="https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/">Chicken and Black Bean Salsa Burritos recipe</a> from the MedlinePlus website.</figcaption>
</figure>

Below is the Python dictionary of 'Chicken and Black Bean Salsa Burritos':
<pre><code class="python-html">
{'@context': 'https://schema.org/',
 '@type': 'Recipe',
 'author': {'@type': 'Organization', 'name': 'Food Hero'},
 'cookTime': 'PT30M',
 'datePublished': '2021-04-01',
 'description': 'Fresh lemon juice and green onions bring out a zesty flavor '
                'in these oven-baked chicken and black bean salsa burritos. '
                'Pepper Jack cheese adds a nice kick!',
 'image': ['https://medlineplus.gov/images/recipe_chickenandblackbeansalsaburritos.jpg',
           'https://medlineplus.gov/images/recipe_chickenandblackbeansalsaburritos_fb.jpg'],
 'keywords': 'lemon juice,green onions,zesty,oven,chicken,black '
             'bean,salsa,pepper jack cheese,lunch,dinner',
 'name': 'Chicken and Black Bean Salsa Burritos',
 'nutrition': {'@type': 'NutritionInformation',
               'calories': '260 calories',
               'carbohydrateContent': '24 grams',
               'cholesterolContent': '55 milligrams',
               'fatContent': '8 grams',
               'fiberContent': '4 grams',
               'proteinContent': '22 grams',
               'saturatedFatContent': '3.5 grams',
               'servingSize': '1/2 burrito (161 grams)',
               'sodiumContent': '410 milligrams'},
 'prepTime': 'PT20M',
 'recipeCategory': 'lunch,dinner',
 'recipeCuisine': 'American',
 'recipeIngredient': ['1 can (15 ounces) black beans, drained and rinsed',
                      '2 green onions, chopped',
                      '1 Tablespoon lemon juice',
                      '1/4 teaspoon ground cumin',
                      '1/2 teaspoon salt, divided',
                      '4 boneless, skinless chicken breasts',
                      '1/4 teaspoon chili powder',
                      '1/4 teaspoon pepper',
                      '1 cup shredded cheese (try cheddar, pepper jack, or '
                      'Mexican blend)',
                      '4 (9-inch) flour tortillas'],
 'recipeInstructions': [{'@type': 'HowToStep',
                         'text': 'Preheat oven to 350 Â°F.'},
                        {'@type': 'HowToStep',
                         'text': 'In a small bowl, combine the beans, green '
                                 'onions, lemon juice, cumin, and 1/4 teaspoon '
                                 'salt.'},
                        {'@type': 'HowToStep',
                         'text': 'Rub the chicken breasts with the chili '
                                 'powder, pepper and the remaining 1/4 '
                                 'teaspoon salt.'},
                        {'@type': 'HowToStep',
                         'text': 'Cook the chicken in a skillet over '
                                 'medium-high heat (350 Â°F in an electric '
                                 'skillet) for 5 to 7 minutes. Turn it over '
                                 'and cook until the internal temperature of '
                                 'the thickest part reaches 165 Â°F using a '
                                 'food thermometer, about 5 to 7 minutes '
                                 'longer.'},
                        {'@type': 'HowToStep',
                         'text': 'Let chicken cool; slice into strips or '
                                 'chunks.'},
                        {'@type': 'HowToStep',
                         'text': 'Divide cheese evenly between tortillas. Top '
                                 'the cheese with equal amounts of chicken and '
                                 'black bean salsa mixture.'},
                        {'@type': 'HowToStep',
                         'text': 'Roll up the burritos and wrap each one in '
                                 'foil.'},
                        {'@type': 'HowToStep',
                         'text': 'Bake burritos until the cheese melts, about '
                                 '15 minutes.'},
                        {'@type': 'HowToStep',
                         'text': 'Refrigerate leftovers within 2 hours.'}],
 'recipeYield': '8 servings',
 'totalTime': 'PT50M',
 'url': 'https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/'}
</code></pre>

Here's the Python code used to print the above:
<pre><code id="codebox" class="python-html clipboard" aria-describedby="tooltip" title="Click to copy">from scrape_schema_recipe import scrape_url
import pprint

url = "https://medlineplus.gov/recipes/chicken-and-black-bean-salsa-burritos/"
results = scrape_url(url)
recipe = results[0]
pprint.pprint(recipe)
</code></pre>

This library is hosted on [pypi](https://pypi.org/project/scrape-schema-recipe/). In order to run the example, the library will need to be installed:
<pre><code class="bash-html">
$ pip3 install scrape-schema-recipe
</code></pre>

This library scrapes the source and gives the results at a list of dictionaries.  The code can optionally be convert the some data into native Python objects, 
* so dates turn into `datetime.date` objects, 
* and durations (like "Cook Time: 30 minutes") into `datetime.timedelta` objects (`datetime.timedelta(seconds=1800)` &mdash; minutes are not a `timedelta` unit).

Since schema.org/Recipe data is structured [Microdata](https://developer.mozilla.org/en-US/docs/Web/HTML/Microdata), this is a pattern that web designers and frontend web developers can have a standard way to structure recipe data.  Others software can copying that structured recipe or doing something else with it that it (software doing nutrition calculations, checking if it meets a specific diet, and so on).

Unit testing is used to ensure that future changes do not break existing functionality.



<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>
<script>hljs.highlightAll();</script>
