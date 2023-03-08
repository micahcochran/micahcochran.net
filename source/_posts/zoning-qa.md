---
title: Zoning Ordinance Question Answering
date: 2023-03-01 15:49:00
tags: 
    - Python
    - Natural Language Processing
    - Knowledge Graphs
    - Question Answering
    - CS662
    - CLI
categories:
    - projects
---

[Zoning Ordinance Question Answering](https://github.com/micahcochran/cs662-qa-land-dev-law-sys) was a team project to create a system that that answers natural language questions about Zoning Ordinance laws.  

The whole idea is to use natural language questions to about Zoning instead of having to use a query language.  Use the power of a question like "Which zoning districts can a restaurant be built within?"  


## Terminal Screencast

<div id="screencast-player"></div>

<br>

**Notes:** A C1 zoning district is a Commercial 1 District.  R1 is Residential 1 Zoning District.  Typical zoning ordinances would allow restaurant in C districts, not R districts due to the intensity of the use. 


<br>

## Technology
A Knowledge graph was created for Zoning Ordinance laws.  The knowledge graph was feed into software that generated question based on templates.  Those questions were used to train the model.  

The software is programmed to match questions to the appropriate SPARQL templates and fill in slots of that template, run the SPARQL query against the Knowledge Graph to get the results. The software was programmed in Python.  SBERT (Sentence BERT) was used to determine similarity of words/phrases, so to similar terms like "quary" and "mining" receive a high score (0.4751) and to unrelated terms like "fish" and "outer space" receive a lower score (0.2087).   XGBoost and scikit-learn are machine learning libraries used to match question text to the SPARQL template and determine the relation slot.  The Knowledge Graph was stored in Turtle RDF and SPARQL was used to query the Knowledge Graph. This was a two person project for the final class project for CS 662 Natural Language Processing.  This software is an application of those methods.


<figure>
    <img src="/images/qakg-tourism.jpg">
    <figcaption> Structure of the two phases of the Question Answering Software, Source: Figure 1 from <a href="#Reference">Aghaei paper.</a></figcaption>
</figure>


Each of these steps shown in the diagram were replicated in the this software.

The International Zoning Code (IZC) was used as the source material to create the Knowledge Graph. RDF triples had to be created to represent permitted uses and dimensional requirements in the Knowledge Graph.

This software could enable citizen exploration of Zoning laws without becoming a legal expert.  The knowledge graphs provides a framework that could be used by professional who deal with multiple Zoning Ordinances to find answers through SPARQL queries (if this frame were adopted by multiple local governments).


## Poster

<a href="https://github.com/micahcochran/cs662-qa-land-dev-law-sys/raw/main/poster/2022-11-29-final-poster.pdf" target="_self">Poster PDF</a>15.5MB

[![Poster](/images/2022-11-29-final-poster.webp)](https://github.com/micahcochran/cs662-qa-land-dev-law-sys/raw/main/poster/2022-11-29-final-poster.pdf)


## Reference
The software method is from this paper:
> S. Aghaei, E. Raad and A. Fensel, "[Question Answering Over Knowledge Graphs: A Case Study in Tourism,](https://ieeexplore.ieee.org/document/9810255)" in IEEE Access, vol. 10, pp. 69788-69801, 2022, doi: 10.1109/ACCESS.2022.3187178.




<script src="/ascii/asciinema-player.min.js"></script>
<script>
    AsciinemaPlayer.create('/ascii/kgqas.cast', document.getElementById('screencast-player'), {
         preload: true,
         theme: "urban",
//         theme: "tango",
    });
</script>