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

The script makes the process of updating the combined <abbr>GIS</abbr> layer fast, easy, and less error prone.

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
    <img src="/images/limits/result_layer.webp">
    <figcaption>Single <abbr>GIS</abbr> layer of all of the municipal limits from QGIS map.  The layers have had labels populated from the <code>NAME</code> column.</figcaption>
</figure>

The resulting combined table (some columns have been omitted):
<table>
    <thead>
        <tr>
            <th>NAME</th>
            <th>ProperName</th>
            <th>MUNITYP</th>
            <th>GNIS</th>
            <th>LOCALFIPS</th>
            <th>LASTUPDATE</th>
            <th>ChangeDesc</th>
            <th>MUNIAREA</th>
        </tr>
        <tr>
            <td>Ardmore</td>
            <td>City of Ardmore</td>
            <td>City</td>
            <td>1304866</td>
            <td>01640</td>
            <td>8/23/13</td>
            <td>NULL</td>
            <td>4.539</td>
        </tr>
        <tr>
            <td>Athens</td>
            <td>City of Athens</td>
            <td>City</td>
            <td>2403123</td>
            <td>02956</td>
            <td>2/23/21</td>
            <td>Added Annex...</td>
            <td>41.063</td>
        </tr>
        <tr>
            <td>Decatur</td>
            <td>City of Decatur</td>
            <td>City</td>
            <td>2404206</td>
            <td>20104</td>
            <td>6/10/19</td>
            <td>NULL</td>
            <td>60.786</td>
        </tr>
        <tr>
            <td>Huntsville</td>
            <td>City of Huntsville</td>
            <td>City</td>
            <td>2404746</td>
            <td>37000</td>
            <td>5/31/19</td>
            <td>NULL</td>
            <td>218.987</td>
        </tr>
        <tr>
            <td>Madison</td>
            <td>City of Madison</td>
            <td>City</td>
            <td>2404989</td>
            <td>45784</td>
            <td>9/2/16</td>
            <td>NULL</td>
            <td>30.478</td>
        </tr>
        <tr>
            <td>Ardmore</td>
            <td>Town of Ardmore</td>
            <td>Town</td>
            <td>2405163</td>
            <td>02260</td>
            <td>12/9/14</td>
            <td>Verified limits...</td>
            <td>2.050</td>
        </tr>
        <tr>
            <td>Elkmont</td>
            <td>Town of Elkmont</td>
            <td>Town</td>
            <td>2406437</td>
            <td>23488</td>
            <td>12/8/14</td>
            <td>Mapped based...</td>
            <td>1.725</td>
        </tr>
        <tr>
            <td>Lester</td>
            <td>Town of Lester</td>
            <td>Town</td>
            <td>2406007</td>
            <td>42352</td>
            <td>5/11/15</td>
            <td>Verified limits...</td>
            <td>1.326</td>
        </tr>
        <tr>
            <td>Mooresville</td>
            <td>Town of Mooresville</td>
            <td>Town</td>
            <td>2406188</td>
            <td>51264</td>
            <td>8/23/13</td>
            <td>NULL</td>
            <td>0.235</td>
        </tr>
    </thead>
</table>

[Screenshot of table](/images/limits/table_combined.webp) in QGIS software.

## Lessons Learned

I learned the hard way that Python virtual environment are a great way to keep an the <abbr>API</abbr> stable, so that the code will most likely still work later.  Updates may have the unintended consequence of changing the <abbr>API</abbr>, for better or worse.  Python virtual environments allow the developer to upgrade when the developer is ready to upgrade.  Not when software in the rest of the environment has been upgraded. 
