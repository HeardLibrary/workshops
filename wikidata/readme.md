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
