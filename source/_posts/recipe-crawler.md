---
title: recipe-crawler
date: 2023-02-28 21:29:54
tags: 
    - Python
    - CLI
categories:
    - projects
---
[recipe-crawler](https://github.com/micahcochran/recipe-crawler) is a Python web crawler for recipes in HTML [https://schema.org/Recipe](https://schema.org/Recipe) (Microdata/JSON-LD), which output cookbooks in JSON format.  Beautiful Soup library is used to get the anchor tags from HTML.  [scrape-schema-recipe](/projects/recipe/) library is used to get the recipes from HTML.  My intended use for the cookbooks was to serve a test suite for recipe software.

Some of the problems that have to be addressed when designing a web crawler:

* Do not visit a webpage twice.
* A web crawler **SHOULD** follow the website's rules crawling, `robots.txt`,
* Prioritize/score URL that are more likely to result in a recipe.
* Randomly, choose one of the best scored URLs.

## Command Line Help

<pre>
$ ./recipe_crawler.py --help
usage: recipe_crawler.py [-h] [-c CONFIG] [-f FILTER] [--limit LIMIT]
                         [-o OUTPUT] [--version]

Recipe Crawler to that saves a cookbook to a JSON file.

optional arguments:
  -h, --help            show this help message and exit
  -c CONFIG, --config CONFIG
                        website configuration YAML file
  -f FILTER, --filter FILTER
                        filter names of websites to crawl
  --limit LIMIT         Limit of number of recipes to collect (default: 20)
  -o OUTPUT, --output OUTPUT
                        Output to a JSON file
  --version             show program's version number and exit
</pre>
<br>