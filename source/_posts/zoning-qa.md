---
title: Zoning Ordinance Question Answering
date: 2023-03-01 15:49:00
updated: 2023-07-23 18:36:00
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

Use natural language questions to answer questions about Zoning instead of having to use a query language.  Query languages can be very precise, but are hard for most people to learn.  Instead of a query, use the power of a question like "Which zoning districts can a restaurant be built within?"


## Terminal Screencast

<div id="screencast-player"></div>

<pre class="nojs">

Commands:
    random question(s) - provides you random question(s) that can be asked
    ask # - ask one of the random questions
    quit/exit - exits program
    clear - clear the screen
    verbose true/false - switch verbosity of program (default false)
    help - this message

 > What is the minimum front setback in the R3a zoning district?
2023-05-20 21:16:38.271 | INFO     | relation_extraction:extract:220 - Loading M
LPClassifier Model: relation_extraction_model.pickle
Answer: 15 [ft_i]
Runtime: 2.879 sec
 > Are restaurants allowed in a C1 zoning district? 
Answer: Yes
Runtime: 2.034 sec
 > Are restaurants allowed in an R1 zoning district?
Answer: No
Runtime: 2.104 sec
 > I would like to build a restaurant.  Which zoning district permits this use?
Answer: C1, C2, C3, C4
Runtime: 3.337 sec
 >
</pre>

<br>

**Notes:** A <abbr>C1</abbr> zoning district is a Commercial 1 District.  <abbr>R1</abbr> is a Residential 1 Zoning District.  Typically, zoning ordinances would allow restaurant in <abbr>C</abbr> districts, but not in <abbr>R</abbr> districts due to the intensity of the use. 


<br>

## Technology
A Knowledge graph was created to represent Zoning Ordinance laws.  The knowledge graph used a template method to generate questions, and train the Neural Network models.  

<p>The software matches questions to the appropriate SPARQL templates and fill in slots of that template, run the SPARQL query against the Knowledge Graph to get the results. The software was programmed in <a href="/tags/Python/">Python</a>.  <abbr>SBERT</abbr> (Sentence BERT) was used to determine (cosine) similarity of words/phrases, which are on a scale of 0.0&mdash;1.0. Terms like "barber shop" and "hair salon" receive a high similarity score (0.6971). Unrelated terms like "elaborate" and "north" receives a low similarity score (0.0456).</p>

XGBoost and scikit-learn are machine learning libraries used to match question text to the SPARQL template and determine the relation slot.  The Knowledge Graph was stored in Turtle RDF, and SPARQL was used to query the Knowledge Graph.

<p>This was a two-person team class project for CS&nbsp;662 Natural Language Processing.  This software is an applies those methods.</p>


<figure>
    <img src="/images/qakg-tourism.jpg">
    <figcaption> Structure of the two phases of the Question Answering Software, Source: Figure 1 from <a href="#Reference">Aghaei paper.</a></figcaption>
</figure>


Each of these steps shown in the diagram were replicated in the this software.

The International Zoning Code (<abbr>IZC</abbr>) was used as the source material for the Zoning rules used to create the Knowledge Graph. The <abbr>IZC</abbr> is a general Zoning Ordinance that does not contain amendments tailored to a specific jurisdiction. <abbr title="Resource Description Framework">RDF</abbr> triples had to be created to represent permitted uses and dimensional requirements for a Knowledge Graph.

This beauty of this software is it enables citizens to explore zoning laws without having to become zoning experts.  The knowledge graphs could be used by a professional who deal has to ask the same question in multiple zoning ordinances. This is done by creating a query (SPARQL), which can be written once and ran many times (once these knowledge graphs are adopted by local governments).

## Another Approach
My team partner, [Seth Lewis](https://www.linkedin.com/in/seth-lewis-bb8999120/), took two different approaches.  One was a training approach that leveraged a corpus.  The other used manual annotation for each question.  These approaches are detailed in the poster (below).

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