---
layout: post
title:  "Getting started with Network Analyis"
date:   2014-11-09 18:49:00
categories: tech
description: "Learn the basics of network analysis using Neo4j and Neo4j graphgists.  By the end of the session you will know the basics of graphing and network analysis and be able to create your own graphs."

---

##Goals

Neo4j is a [NOSQL](https://en.wikipedia.org/wiki/NoSQL) database that allows for coding relationships among things. [Cypher](http://neo4j.com/developer/cypher-query-language/) is the query language that allows us to create nodes, relationships, and then ask questions of them. In this class we will create a small graph of the Borges story ["On Exactitude in Science"](http://www.sccs.swarthmore.edu/users/08/bblonder/phys120/docs/borges.pdf) noting the complexity of the story and illustrating some of the patterns that allowed for this complexity.

##Graphing for textual analysis

To get started, watch this video that will introduce you to the key concepts we will use while creating a graph of Borges' story. 

[![Network](http://img.youtube.com/vi/Zgkmbk-Qf_4/0.jpg)](http://www.youtube.com/watch?v=Zgkmbk-Qf_4)

[Full graph annotation  of the Flannery O'Connor short story "The Life You Save May Be Your Own"](http://gist.neo4j.org/?3775cf12f473866affcf)


## What you will need 

1) Log in to your [Github](https://github.com/) account or set one up. If you do not know what Github is, it will all be explained at the Github website.

2) In a separate window, navigate to [Neo4j GraphGist](http://gist.neo4j.org/).

3) Read the short story ["On Exactitude in Science"] (http://www.sccs.swarthmore.edu/users/08/bblonder/phys120/docs/borges.pdf) by Jorge Luis Borges. It is very short, but also very complex, so it is a good text to use when learning about graphing for textual analysis. 


##Cypher: The Neo4j Query Language
Now we will look at a very simple graph that has been coded with Cypher to express generic nodes and relationships. Your job will be to modify the cypher to change the variables to something meaningful. In order to do this, go to:

* [The gist for the graph](http://gist.neo4j.org/?3e91a19c317acd660d71).
* Fork the gist which will create a new gist in your own github account.
* Go to the open window at the [Neo4j graphgist](http://gist.neo4j.org/) and paste the url of the gist into the search box in the upper right hand corner of the page.

![Graph Gist](http://www.library.vanderbilt.edu/webimages/graphs/url.png)


Once you are on this page, click the Page Source button at the top left of the page. Then select "edit" to  edit the page.  Scroll down until you see this Cypher code.

     === OUR DATASET
      [source, cypher] 
   ----
    CREATE
      //People
      (a:Person{name:'a'}),
      (b:Person{name:'b'}),
      (c:Person{name:'c'}),
      
       //Places
      (d:Location{name:'d'}),
      (e:Location{name:'e'}),
      
      //Relationships
      (a)-[:R]->(b),
      (b)-[:S]->(c),
      (b)-[:T]->(d),
      (c)-[:U]->(a),
      (e)-[:Z]->(b)


      ----

To make changes to the code put a real person's name into the first "People" node, change another node, and then specify what the relationship is under "Relationships".

   ----
    CREATE
      //People
      (a:Person{name:'Donald Trump'}),
      (b:Person{name:'Barack Obama'}),
      (c:Person{name:'c'}),
      
       //Places
      (d:Location{name:'d'}),
      (e:Location{name:'e'}),
      
      //Relationships
      (a)-[:OPPOSES>(b),
      (b)-[:S]->(c),
      (b)-[:T]->(d),
      (c)-[:U]->(a),
      (e)-[:Z]->(b)


      ----

Note that in the above example, we have named the "a" variable "Donald Trump" and the "b" variable "Barack Obama," so in our Relationships statement, we need only reference the variables to express the OPPOSES relationship. 


###On Exactitude in Science
![On Exactitude In Science](http://www.baunetz.de/img/9/7/3/8/5/3/086b2181c747f019.jpg)


Though the story is only one paragraph long, Borges has woven into the narrative many levels of interpretation. No one graph of the story can ever include all of the threads, allusions, associations, and planes (unless of course as in the story itself, the map becomes the territory!), but it is illuminating to try and encode some of these in a graph.

First, create a data model. 

## Creating the data model

Data modeling can be very simple and hand drawn. Below is an illustration of a hand drawn data model that was later coded into a Neo4j graph. 

![Data Model](http://www.library.vanderbilt.edu/webimages/graphs/graph.png)


There is no "correct" data model for a short story. It really depends on YOUR understanding of the story and how you want to express that understanding as a graph. After reading the short story, draw a data model that best illustrates the relationships you would like to graph. 

Next, using the Cypher example from the first activity above, create nodes and relationships as outlined by your data model. View the graph by plugging it into the Neo4j graphgist.  

## Graphing for literary analysis

As noted in the video at the start, good readers have always been close readers. Graphing a short story is really just another way to annotate a text, something students and scholars have always done. It is also a fun and easy way to learn about graphing and network analysis. 

<img src="http://lbhs.yourcharlotteschools.net/documents/Study%20skills/Notetaking%20Templates/Linguistic%20graphic%20organizers/sample%20poetry%20annotation.jpg" width="250">

##Next Steps
Whenever you are creating nodes and relationships among nodes you are creating a mathematical graph. Mathematical graphs have properties that can be used to analyze large complex graphs, which we often call networks or intricate graphs, such as in the Borges short story. By traversing the patterns in the graph, we can uncover information that was not immediately apparent. Services like Facebook, Linked In, and OKCupid all use graphing technology to manage the large datasets and complex interconnections that allow for recommendations, targeted advertising, and friend suggestions. Google takes advantage of network properties to create algorithms that surface relevant information. The dream of the semantic web and the reality of the World Wide Web all depend on the properties of networks and mathematical graphs to deliver information. 

###Further Reading:

[Linked: How Everything Is Connected to Everything Else and What It Means for Business, Science, and Everyday Life](http://www.amazon.com/Linked-Everything-Connected-Business-Everyday/dp/0452284392)
This book is a little outdated bu still very good in explaining how graphs and networks operate. 

[How Graph Databases Relate To Other NoSQL Data Models](http://neo4j.com/developer/graph-db-vs-nosql/)
Good explanation of why you might want to use a graph database instead of a relational database.

[Linked Data and the Semantic Web](http://www.w3.org/standards/semanticweb/data) 
Both "Linked Data" and the "Semantic Web" are nomenclatures developed by Tim Berners Lee and the W3C to describe a set of standards and technologies that encode data on the web as graphs so that information not available through other query mechanisms can be revealed.

