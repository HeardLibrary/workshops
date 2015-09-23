---
layout: post
title:  "Get started with Network Analyis"
date:   2014-11-09 18:49:00
categories: tech
---

##Goals

Neo4j is a NOSQL database that allows for coding relationships between things. Cypher is the query language that allows us to create the nodes and relationships between things and then ask questions of them. In this class we will create a small graph of the Borges story "On Exactitude in Science" noting the complexity of the story and illustrating some of the patterns that allowed for this complexity.

##Graphing for textual analysis

To get started, watch this video that will introduce you to the key concepts we will use while creating a graph of Borges' story. 

[![Network](http://img.youtube.com/vi/Zgkmbk-Qf_4/0.jpg)](http://www.youtube.com/watch?v=Zgkmbk-Qf_4)

[Full graph annotation  of the Flannery O'Connor short story "The Life You Save May Be Your Own"](http://gist.neo4j.org/?3775cf12f473866affcf)


## What you will need to do in order to complete the class

1) Log in to your [Github]((https://github.com/) account or set one up. If you don't know what Github is, it will all be explained at the Github website.

2) In a separate window, navigate to [ Neo4j GraphGist] (http://gist.neo4j.org/.)

3) Read the short story ["On Exactitude in Science"] (http://www.sccs.swarthmore.edu/users/08/bblonder/phys120/docs/borges.pdf) by Jorge Louis Borges. It is very short but also very complex so it is a good text to use when learning about graphing for textual analysis. 


##Cypher-the Neo4j Query language
Now we will look at a very simple graph that has been coded with Cypher to express generic nodes and relationships. Your job will be to modify the cypher to change the variables to something meaningful. In order to do this, go to this [gist] (http://gist.neo4j.org/?3e91a19c317acd660d71) fork the gist which will create a new gist in your own github account. Once you have done this and you have the URL, go to the open window at the [Neo4j graphgist] ( http://gist.neo4j.org/)
and paste the url of the gist into the search box in the upper right hand corner of the page.

![Graph Gist](http://www.library.vanderbilt.edu/webimages/graphs/url.png)


Once you are on this page, click  the Page Source button at the top left of the page. Then select "edit" to  edit the page.  Scroll down until you see this Cypher code.

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

To make changes to the code put a real person's name into the first "People" node.

   === OUR DATASET
      [source, cypher]
   ----
    CREATE
      //People
      (a:Person{name:'Donald Trump'}),
      (b:Person{name:'b'}),
      (c:Person{name:'c'}),
      
       //Places
      (d:Location{name:'New York'}),
      (e:Location{name:'e'}),
      
      //Relationships
      (a)-[:LIVES_IN]->(b),
      (b)-[:S]->(c),
      (b)-[:T]->(d),
      (c)-[:U]->(a),
      (e)-[:Z]->(b)


      ----


</div>
You can do the same thing for any of the other People or Places nodes. Now create a relationship between two nodes that you have configured. It might look something like this:
<div>
(a)-[:KNOWS]->(b),
</div>
or

<div>
(a)-[:IS_FROM]->(b),
</div>
After creating a few more examples, you are ready to move on to creating a data model for the short story.

## Creating the data model

Data modeling can be very simple and hand drawn. Below is an illustration of a hand drawn data model that was later coded into a Neo4j graph.

![Data Model](http://www.library.vanderbilt.edu/webimages/graphs/graph.png)
###On Exactitude in Science
Though the story is only one paragraph long, Borges has woven into the narrative many levels of interpretation. No one graph of the story can ever include all of the threads, allusions, associations and levels (unless of course as in the story itself, the map becomes the territory) but it is illuminating to try and encode some of these in a graph.

First, create a data model. It might look something like this:

Or it might be completely different. It really depends on YOUR understanding of the story and how you want to express that understanding as a graph.

Next, using the Cypher example from the first activity above, create nodes and relationships as outlined by your data model. Here is an example of what a very simple graph might look like. Yours can be as simple or as complex as you want it to be.



##Value of Graphing for literary analysis

As noted in the video at the start, good readers have always been close readers. Modelling a short story in this way can help us see beyond the surface narrative and perhaps help us glimpse the glimmering warp and weft of the inner story. It is really just another way to annotate a text, something students and scholars have always done.   


##Next Steps
