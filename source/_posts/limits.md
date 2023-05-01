---
title: combined_municipal_limits_geoprocessing
tags:
  - Python
  - GIS
  - ETL
  - geoprocessing
categories:
  - projects
date: 2023-05-01 15:26:12
---


[combined_municipal_limits_geoprocessing](https://github.com/micahcochran/combined_municipal_limits_geoprocessing) is a Python command line <abbr title="Extract Tranform Load">ETL</abbr> script that combines City Limits from multiple <abbr title="Geographic Information Systems">GIS</abbr> layers into one <abbr>GIS</abbr> layer using a unified schema for Limestone County (Alabama, USA). This takes five (5) files, with four (4) different schema and two (2) projections. The script merges the files are merged into one layer with one projection and one schema.

## Source Data

<abbr>GIS</abbr> data from different sources has attribute tables that can vary widely:
<figure>
    <img src="/images/limits/dec_table.webp">
    <figcaption>Attribute table from Decatur City Limits.</figcaption>
</figure>

<figure>
    <img src="/images/limits/hsv_table.webp">
    <figcaption>Attribute table from Huntsville City Limits.</figcaption>
</figure>

<figure>
    <img src="/images/limits/mad_table.webp">
    <figcaption>Attribute table from Madison City Limits.</figcaption>
</figure>

Here are the 5 different <abbr>GIS</abbr> layer as viewed <abbr>GIS</abbr> window:
<figure>
    <img src="/images/limits/5mun_limit_layers.webp">
    <figcaption>The 5 input GIS layers shown in QGIS software.  Note: QGIS has the ability to reproject data automatically.  There are two different <abbr title="Coordinate Reference System">CRS</abbr> with Alabama State Plane East and Alabama State Plane West.</figcaption>
</figure>

## Result Data

The resulting <abbr>GIS</abbr> data of the <abbr>ETL</abbr> script.

<figure>
    <img src="/images/limits/table_combined.webp">
    <figcaption>Combined table.</figcaption>
</figure>

<figure>
    <img src="/images/limits/result_layer.webp">
    <figcaption>Single <abbr>GIS</abbr> layer of all of the municipal limits from QGIS map.  The layers have had labels from the <code>NAME</code> column.</figcaption>
</figure>


## Leasons Learned

I learned the hard way that Python virtual environment are a great way to keep an the <abbr>API</abbr> stable, so that the code will most likely still work later.  Updates may have the unintended consequence of changing the <abbr>API</abbr>, for better or worse.  Python virtual environments allow the developer to upgrade when the developer is ready to upgrade.  Not when software in the rest of the environment has been upgraded. 
