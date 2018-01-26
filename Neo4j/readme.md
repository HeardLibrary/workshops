# Graph Databases 
Not flimsy nonsense, but a web of sense.
---Vladimir Nabokov

## Learning Outcomes

* Articulate the differences between graph databases and relational databases.
* Understand the principles of mathematic graphs.
* Be able to load .csv data into Neo4j.

### What is a Graph?

Let's start out with what a graph is NOT (at least in the sense in which we mean it here). A graph is not a bar chart or a pie chart. For our purposes, a graph is a mathematically defined set of nodes (vertices) and edges that have inherent properties. Once data has been expressed as a graph, it can be traversed and queried so that the patterns inherent in the dataset, can be explored and analyzed, revealing insights that might not have been immediately apparent. The Panama Papers, the journalistic study suggesting possible improprieties in the offshore banking world used Neo4j to tease out illegal or immoral activities from millions of perfectly legal transactions.

![Mathematical graph](http://www.tutorialspoint.com/neo4j/images/neo4j_nodes_and_relationship.jpg)


### What is a Graph Database
So what is a graph database? We are all familiar with relational databases as most people have used these kinds of databases even if they don't know they are using them. Originally built for the banking industry, they store data in predetermined rows and columns and require a rigid data model. Graph databases on the other hand, store data in graph structures. Because of this, they are good for projects where ambiguity and complex relationships do  not neatly fit into the more linear structure of a relational database.  Graph databases are especially helpful in humanities research when the data is often ambiguous and complex.

![Relational Databases](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/from_relational_model.png)

![Graph Database](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/to_graph_model.png)

[Differences between graph and relational databases](https://neo4j.com/developer/graph-db-vs-rdbms)

## What kinds of graph databases are out there?  

### Neo4j
Neo4j is a graph database application that stores data as vertices and edges in the form of nodes and relationships or attributes of a node or relationship.  The [Neo4j community edition](https://neo4j.com/download/) is an open source tool that can be downloaded to your workstation or used in the cloud via [GrapheneDB](http://www.graphenedb.com/). There are certain restrictions on both of them but for many projects in the digital humanities, the community edition will be fine. Neo4j and Cypher, the Neo4j query language, are very intuitive and the [tutorials](https://neo4j.com/developer/get-started/) clear and concise so, while it may take some time to master cypher, it is not necessary to have a programming background to get started.  

## Loading data from .csv files into Neo4j

* Code for loading .csv files [https://gist.github.com/suellenstringer-hye/8b18944955a99542a5728d856705d46c]
* Github repository [https://github.com/suellenstringer-hye/VUIR-Data-Project] 
* Graphs without ontologies [https://github.com/HeardLibrary/graphs-without-ontologies]
