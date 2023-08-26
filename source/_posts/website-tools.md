---
title: Website Tools
date: 2023-02-28 13:41:22
update: 2023-07-31 14:24:00
tags:
    - website
    - JavaScript
categories:
    - projects
---

I created a [small amount of custom JavaScript](https://github.com/micahcochran/micahcochran.net/blob/main/themes/minima/source/js/user.js) for this website.

Heres a selection of the software used to create this website:

* [hexo](https://hexo.io/) - static site generator
    * [Minima hexo theme](https://github.com/adisaktijrs/hexo-theme-minima)
* [Favicon.io](https://favicon.io/) - create a favicon
* ImageMagick - used within a shell script (fish) to create thumbnails of the PDF files

Here's software that is used on this website that has a Javascript component (and occasionally needs updating):
* [asciinema](https://asciinema.org/)-player - plays back the captured terminal sessions
* [Bootstrap Icons](https://icons.getbootstrap.com/) - Replaced Feather icons because there are 6 times the number of icons and there are more choices for alternative icons.
* [Chart.js](https://www.chartjs.org/) - used for displaying pie charts on resume.
* [highlight.js](https://highlightjs.org/) - code syntax highlighting

---
# Fomerly Used
* [Feather](https://feathericons.com/) icons are used on my resume.  The only issue with these is that the number of icons was sometimes limited.
* [Plotly.js](https://plotly.com/javascript/) - was used for pie charts on resume.  This library is easy to us and is overkill for casually applications for charts.  Also, its JavaScript file size is a bit large at 5 MiB.