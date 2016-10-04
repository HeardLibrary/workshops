---
layout: post
title:  "Getting Started with Cartography"
date:   2016-10-04 11:00:00
categories: tech
description: Explore concepts of cartography.
---

# Fundamentals of Cartography

## Learning Objectives
* Learn the basics of Cartography
* Develop understanding of the types of maps
* Review examples of types of maps

## What is Cartography?
Cartography is the science and aesthetic of map-making.  Given that maps are made up of static, tabular data at their core, it takes the artistic hand of the cartographer to display that data in a way that is not only pleasing to the eye, but also effective in making the argument presented.  Creating an effective map is akin to telling a story.  The map must be woven together in a way that gives purpose to every layer and that the user will be able to derive meaning.

It is also the duty of the cartographer, to create a map that brings about spatial awareness in regards to the environment in which we live.

## Elements to Consider When Making a map

One thing to consider when map-making, is what information you wan to present and for what purpose.  Who is the map being made for? For example, the type of map you would create for a journal publication would look drastically different from a map that you would make for a poster or conference presentation.  Organization, or how the information is presented, and scale (is local, regional or national scale appropriate?) are two other factors that may be useful to consider when making a map.

## Design Principles

There are several design principles that are necessary to consider when making a map.  Contrast, legibility, balance, color scheme, and symbology are all important design factors.

## Elements of a map

There are some basic elements to a map that need to be considered and included when creating a useful and aesthetically pleasing map.

* North arrow
* Scale boundaries
* Legend
* Title or description
* Projection

Most maps contain several pieces of information that make them more useful.  For example, a north arrow and scale are both very important features.  Without a north arrow and a scale, the map user may not be able to properly orient themselves. Choosing a north arrow that matches the theme of the map is also important.  For example, you would not typically choose a nautical themed north arrow for a map over the midwest United States.    

A legend is also very important, as this relays information about what is being shown in the map.  It may not be apparent to the user what the content is without the use of an effective legend.  The legend usually contains a description of the variables being shown and their breakdown.  

Projection is a very important element to consider when making a map.  Using an incorrect projection can have negative effects on the aesthetic of a map.  For example, using a mercator project can distort the poles and make land masses seem much larger than they actually are, so if the focus of the map is the north pole, using a mercator projection would not make sense.

### Map Types

There are two basic map "schools" if you will.  Reference and Thematic maps make up most of what you see on a day to day basis.  Reference maps are meant to display geographic information about the world in which we live, directional type information.  Thematic maps, on the other hand, are used to display specific variables about the world in which we live.  For example, a thematic map might show what the weather is like for a given day, and may be layered on top of a reference map that shows the physical boundaries of the United States and major roads.

### Reference Maps


#### Physical

CIA Factbook
![Physical Map](http://i.imgur.com/LdcF45m.jpg?1)

#### Political

CIA Factbook
![Political Map](http://i.imgur.com/SrEQnOw.jpg)

#### Relief

![Relief Map](http://i.imgur.com/RGjci5z.png)

#### Road

CIA Maps
![Road Map](http://i.imgur.com/WsidLrV.jpg)

#### Topographic

![Topographic Map](http://i.imgur.com/AxioZBU.png)

### Thematic Maps
#### Choropleth
A choropleth map is a type of thematic map that is used to represent a statistic or variable by using shaded polygons.  Typically these shaded areas represent a range of amounts for a statistic, such as the age variable shown in the map below.  In this example each census block group is shaded to represent ranges of actual population values on the left, and population per acre values on the right.

  ![Imgur](http://i.imgur.com/NZAfOTG.png)

#### Graduated Symbols

A graduated symbol map is very similar to a choropleth map, in that it is used to represent a statistic or variable.  This time, the variable is represented with a symbol of varying size, representing the quantity of the variable in question. In the example shown below, there is a choropleth map being used as the basemap, and layered on top of that are the graduated symbols.  Ranging from small to large, to represent low to high value ranges for percentage of the population with a high school diploma (data from the American Community Survey, 2006).

  ![Graduated Symbol Map](http://i.imgur.com/LpV4hjL.png)

#### Dot map

A dot map (dot distribution or dot density map) is another type of thematic map.  A dot map is used to represent density of values.  The presence or absence of dots are used to show spatial variation or pattern of a particular variable.  In the example shown below ([Bill Rankin, 2009](http://www.radicalcartography.net/index.html?chicagodots)), each dot represents 25 people of various ethnic self-identifications from 2000 Census data.  The map cartographer in this example does a good job of representing the spatial distribution of various communities across Chicago in 2000 in both an effective and aesthetically pleasing manner.

  ![Dot Map](http://i.imgur.com/SD0eTFU.png)

#### Isopleth map

An isopleth map or a contour map, is used to display areas of a region where similar phenomena or values occur.  When used in the context of a traditional elevation map, the contours are used to represent areas with the same elevation (where areas, above or below the line represent elevations that are higher or lower).  In the example shown below, the weather map is used to show areas where the pressure reaches 500mb, respectively.  This is used by meteorologists to interpret weather patterns.

  ![Isopleth](http://i.imgur.com/WlLFevt.png)

#### Cartogram

A cartogram is a little bit harder to fully understand.  It is similar to a choropleth map in that the colors represent various values, the difference being that in a cartogram the polygons, or US Counties in the example shown below, are distorted in order to better represent the impact a certain variable has on the region.  In other words,  the polygon areas are normalized to the size of variable.

The example shown below was done by [Mark Newman, 2012](http://www-personal.umich.edu/~mejn/election/2012/), and is one of a set of maps used to explore the 2012 US presidential election results.  Each county is distorted in order to represent the total population of a given area.  Notice, the higher populated areas of the northeast US, which take up a much smaller portion of the physical area in the United States, appear much larger.  This is because those areas are more densely populated and this is shown by the enlarged county sizes.

  ![Cartogram](http://i.imgur.com/CH4PmDI.png)

#### Dasymetric map

![Imgur](http://i.imgur.com/AJ0UEIK.png)

## What Does a Bad Map Look Like?

Not all maps are created equal.  So, what makes a bad map?  There are a lot of aesthetic mistakes a cartographer could make.  Some are less egregious than others.  Label placement and density is one very easy mistake commonly made.  Overpresentation of information should not be mistaken for an effective map.

* Example of too many labels

The use of color is also an element that needs to be carefully considered.  For example, neon colors, in most cases, are usually not appropriate.  

* Example of too many colors

Appropriate scale values are also important to consider when making a map.  Audience considered, units and unit breakdown are vital to think through.

 * Example of bad scale

## A Note About Web maps

When to use paper maps versus web map is another important variable to consider when making a map.  Who will be the audience for this particular map?  Does it make more sense for the map to be interactive rather than passive?  In the case that it makes more sense for a map to be interactive, a web map would be the better choice.  

## Map Candy

Here are some cool map projects for you to drool over:
* [Wind Map](http://hint.fm/wind/)
* [The United States of Lego](http://www.arcgis.com/home/webmap/viewer.html?webmap=14bbbd118d3c4f48bd2aaf9cd888b219)
* [Pollock Style Election Map 2015 UK General Election](http://carto.maps.arcgis.com/apps/webappviewer/index.html?id=661d96be9fe64b3db4124546b67b2f39)
* [Artic Projection](https://www.mapbox.com/gallery/#map-15)
* [The Obsessively Detailed Map of American Literature's Most Epic Road Trips](http://www.atlasobscura.com/articles/the-obsessively-detailed-map-of-american-literatures-most-epic-road-trips)



