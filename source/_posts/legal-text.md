---
title: Legal Text Website
date: 2023-02-12 17:28:00
tags: 
    - Python
    - Flask
    - CS621
    - MongoDB
    - SQLite
    - BeautifulSoup
    - website
categories:
    - projects
---

The task was to scrape the 1901 Constitution of Alabama, and build website that presents legal codes in a more usable website.  


## State's Design

This is the [State of Alabama's design](http://alisondb.legislature.state.al.us/alison/CodeOfAlabama/Constitution/1901/Constitution1901_toc.htm) to display the Alabama Constitution as of 2022 with amendments.  Their design is very basic.


<figure>
    <img src="/images/ltext/al-constition-1901.webp">
    <figcaption>Screenshot from State's website of the 1901 Constitution of Alabama</figcaption>
</figure>


## Redesign

The concept was to make small design improvements that could make the text more useable.  This includes a new design, search, and easy to copy section links.  A user login system is allows some actions like deleting legal codes that most users should not have. 

<figure>
    <img src="/images/ltext/1_browse.webp">
    <figcaption>Design for the new website that pulls the text from MongoDB.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/2_links.webp">
    <figcaption>Click on the chain icon and it copies the link that section to the clipboard.  This feature only works on the Chrome based browsers.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/4_search_results.webp">
    <figcaption>Search results for &ldquo;governor&rdquo;.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/5_login.webp">
    <figcaption>Login screen.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/6_register.webp">
    <figcaption>Registration screen.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/9_new_book.webp">
    <figcaption>Create a new book.</figcaption>
</figure>

<figure>
    <img src="/images/ltext/10_delete_book.webp">
    <figcaption>Delete a new book.</figcaption>
</figure>



## Fonts

The fonts used in the design.

* Libre Baskerville and Merriweather. These are serif fonts mainly intended to display legal
text.
* Inter. This is a san-serif font mainly for settings.


## Notes

The Frontend is HTML and a small amount of Javascript.  The backend is Flask library using Python.  The text of the Alabama Constitution is stored in MongoDB.  User credentials are stored in a SQLite database.

The scraper was custom Python code (using BeautifulSoup library).  It was written in a manner to allows legal codes scraping from other websites. These scraper would need some level of customization.

Sole group member on the project for class CS 621 Advanced Web Application Development.