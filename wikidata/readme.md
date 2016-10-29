# Getting Started with Wikidata

This tutorial introduces the basics of [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), an offshot of Wikipedia. Since its launch four years ago on October 30, 2012, Wikidata has developed rapidly and has become a repository of all kinds of facts across the Wikipedia language editions. In what follows, you will become familiar with the purpose and goals of Wikidata, including how to contribute to its development.

## Learning Outcomes

* Articulate the short and long term goals of Wikidata
* Learn various ways to contribute Wikidata
* Write simple SPARQL queries to retrieve data from Wikidata

## What is Wikidata?

To understand the problems that Wikidata addresses, you need to reflect on the challenges posed by Wikipedia's [295 language editions](https://en.wikipedia.org/wiki/List_of_Wikipedias). Ideally, articles in these language editions should be linked together. So, if you create an article about a Portuguese scholar on the English Wikipedia, you'd want to connect that article to any existing articles on other language editions, including the Portuguese edition but also to the Chinese, French, etc. editions too. In the past, you had to create these language links manually. As might be expected, syncronizing editions was sometimes spotty, meaning that an equivalent article might exist on another language edition, but not be reported on your edition. 

* [Phase One](https://en.wikipedia.org/wiki/Wikidata#Phase_1) aspires to connect articles on the same topic across language editions. Rather than asking editors to link from every language edition to every other language edition, Wikidata centralized the process. In other words, the Wikidata project moved the relationship between Wikipedia editions from a [matrix model](https://commons.wikimedia.org/wiki/File:Complete_graph_K7.svg) to a [hub-and-spoke model](https://upload.wikimedia.org/wikipedia/commons/4/49/Star_network_7.svg).

* [Phase Two](https://en.wikipedia.org/wiki/Wikidata#Phase_2) connected the statements made on the different language editions. If, for instance, you put up an infobox with a photograph about a intellectual figure on one language edition, you'd like other editors to have access to that information. This phase of the Wikidata project makes that possible and is gradually extending the range of statements that you can query across language editions.

* [Phase Three](https://en.wikipedia.org/wiki/Wikidata#Phase_3) will make it possible to share lists across language editions such as, for example, this [List of female scientists in the 21st century](https://en.wikipedia.org/wiki/List_of_female_scientists_in_the_21st_century) and to make sure that they get updated automatically when new information is entered.

## Let's Make Some Edits!

Now that you have a sense of what Wikidata is about, let's make some contrbutions. Wikidata is not just about automating the exchange of information. Just like Wikipedia, it's freely editable and you can contribute information to it directly.

### Setting Your Languages

You create a username for Wikidata just like you do on Wikipedia. In fact, if you have signed into Wikipedia already, you should already have a username on Wikidata. You can create your user page and talk page just as you would on Wikipedia. If you're interested in editing labels in languages other than English, you can also add language codes using the Babel extension to Wikidata: `{{#babel:en-N|fr-3|de-5}}`

### Taking the *Items* Tour

Let's start with taking an introductory [tour](https://www.wikidata.org/w/index.php?title=Q16943273&tour=wbitems&uselang=EN&data=ok) of how to edit Wikidata items. An [item](https://www.wikidata.org/wiki/Wikidata:Glossary#Item) according to Wikidata is a "a real-world object, concept, event that is given an identifier." Items have names like [Q30](https://www.wikidata.org/wiki/Q30). While these names look weird to speakers of English (or any other natural language), they provide a way of identifying information across editions without privileging any particular linguistic community. In other words, we all need to learn Wikidata's version of [Esperanto](https://www.wikidata.org/wiki/Q143).

## Let's Query Wikidata

The best part about wikidata is that you don't need to look up information across its various pages. You can write simple (and complex) queries to pinpoint precisely the data you want to receive. The query language for Wikidata is called [SPARQL](https://www.w3.org/TR/sparql11-overview/) or the SPARQL Protocol and RDF Query Language. 

### Example SPARQL Queries

#### List of Female Artists

```sparql
#Female artists
#Forked from http://tinyurl.com/zjnpbm5
SELECT DISTINCT ?women ?womenLabel
WHERE
{
  ?women wdt:P31 wd:Q5 ; # human beings
         wdt:P21 wd:Q6581072 ; # female
         wdt:P106 wd:Q483501 . # artists
  SERVICE wikibase:label {bd:serviceParam wikibase:language "en" }
}
LIMIT 100
```

#### Cultural Heritage Institutions in New York City

```sparql
#Cultural Heritage Institutions in New York City
#defaultView:Map
SELECT DISTINCT ?institutionLabel ?image ?coor
WHERE
{
  ?entity wdt:P279* wd:Q5193377.
  wd:Q60 wdt:P150* ?location . 
  ?institution wdt:P31 ?entity ;
               wdt:P131 ?location ;
               wdt:P625 ?coor.
OPTIONAL {?institution wdt:P18 ?image. }
SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
}
```
#### Genres of Artists in Wikipedia

```sparql
#Genres of Artists in Wikipedia
#Forked from http://tinyurl.com/zo2cl2c
#defaultView:BubbleChart
SELECT ?genre ?genreLabel (count(*) as ?count)
WHERE
{
  ?pid wdt:P31 wd:Q5 ;
  wdt:P135 ?genre .
  OPTIONAL {
    ?genre rdfs:label ?genreLabel
    filter (lang(?genreLabel) = "en")
  }
}
GROUP BY ?genre ?genreLabel
ORDER BY DESC(?count) 
LIMIT 75
```

#### Founding Dates of Research Universities

```sparql
#Research University Timeline
#Forked from http://tinyurl.com/jrv757r
#defaultView:Timeline
SELECT ?university ?universityLabel ?founding (SAMPLE(?image) AS ?image)
WHERE
{
  ?university wdt:P31 wd:Q15936437 ;
              wdt:P571 ?founding .
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
  OPTIONAL { ?university wdt:P18 ?image }
}
GROUP BY ?university ?universityLabel ?founding
LIMIT 50
```

#### Occupations of Graduates of Vanderbilt University

```sparql
#Occupations of Graduates of Vanderbilt University
#defaultView:Graph
SELECT ?graduate ?graduateLabel ?occupation ?occupationLabel ?university ?universityLabel
WHERE
{
    ?university wdt:P373 "Vanderbilt University" .
    ?graduate wdt:P69 ?university ;
              wdt:P106 ?occupation .
  	 
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en" }
    OPTIONAL { ?graduate wdt:P18 ?image }
}

Limit 50
```

### Let's Play with Wikidata

By way of conclusion, let's try out the [Wikidata Game](https://tools.wmflabs.org/wikidata-game/) and see whether we can make improvements to the quality of Wikidata's data.
