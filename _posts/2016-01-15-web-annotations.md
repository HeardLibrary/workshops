---
layout: post
title:  "Getting Started with Web Annotations"
date:   2016-01-15 11:00:00
categories: tech
description: Explore the concept of web annotation and discuss its use in research and learning.
---
#Web Annotations

Do you have notes in the margins of your books? Do you highlight important phrases and passages? Do you refer back to these notes later in the research and learning process? Have you ever wished you could do the same with web pages and PDFs?...

 Web annotation tools provide the capability of filling in the margins of the web with notes and ideas. These notes can go social with the use of groups, or stay private for your own use. With applications to research and learning this web annotations provide a way to create and share a running commentary on the World Wide Web.

A web annotation is an online annotation associated with a web resource. With a web annotation system, a user can add, modify or remove information from a web resource without modifying the resource itself. The annotations can be thought of as a layer on top of the existing resource, and this annotation layer is usually visible to other users who share the same annotation system ([Wikipedia](https://en.wikipedia.org/wiki/Web_annotation)). 

Now let's  explore the concept of web annotation and discuss its use in research and learning.

## Learning Objectives
* Explore the concepts of Web Annotations and practice their application through the use of Hypothes.is Web Annotation tool. 
* Develop use cases for this technology.
* Evaluate examples of this technology.

## Note
This presentation makes use of the [Hypothes.is](http://hypothes.is) web annotation tool. Collaborate with us as we learn about web annotation.

* Please download and enable the [Hypothes.is extension for Chrome](https://chrome.google.com/webstore/detail/hypothesis-web-pdf-annota/bjfhmglciegochdpefhhlphglcehbmek), 
* create a user profile with the service, and
* join the [Web Annotations Workshop](https://hypothes.is/groups/JEQoYxZJ/web-annotations-workshop) group.

Now you can annotate this page and other pages we will look at today with the group.

##What Are Web Annotations?
Web annotations is a concept specific to the Internet. *Web* here referring to the world wide web - the net of interconnected [documents](http://people.ischool.berkeley.edu/~buckland/digdoc.html). Web annotations create another layer of the web - graph of relationships each annotation pointing to others and the  other and to the internet resources they reference.

The [Web Annotation Data Model](https://www.w3.org/TR/annotation-model/) provides two definitions along with a draft of specifications to use when implementing annotation functionality.

* [Annotations](https://hypothes.is/a/AVJCyczf8sFu_DXLVd0N) are typically used to convey information about a resource or associations between resources. Simple examples include a comment or tag on a single web page or image, or a blog post about a news article. 

* [An annotation](https://hypothes.is/a/AVJCxP6_8sFu_DXLVdz9) is considered to be a set of connected resources, typically including a body and target, and conveys that the body is related to the target. The exact nature of this relationship changes according to the intention of the annotation, but the body is most frequently somehow "about" the target. This perspective results in a basic model with three parts, depicted below. The full model supports additional functionality, enabling content to be embedded within the annotation, selecting arbitrary segments of resources, choosing the appropriate representation of a resource and providing styling hints to help clients render the annotation appropriately. Annotations created by or intended for machines are also possible, ensuring that the Data Web is not ignored in favor of only considering the human-oriented Document Web. 

###History Lesson
Early visions of the web included annotations ([Todd A Carpenter](http://scholarlykitchen.sspnet.org/2013/04/30/iannotate-whatever-happened-to-the-web-as-an-annotation-system/), [Wikipedia](https://en.wikipedia.org/wiki/Memex). The Memex machine envisioned by Vannevar Bush was a prototype hypertext machine and included functionality for producing and recalling personal annotations. Tim Berners Lee included annotations in the early models of the web, and they were [almost](https://hypothes.is/a/AVJC6HpH8sFu_DXLVd11) part of the early web browser [Mosaic's](https://en.wikipedia.org/wiki/Mosaic_(web_browser)) design. 

[Marc Andreessen](http://genius.com/MarcAndreessen), one of Mosaic's developers, invested in [RapGenius](http://rap.genius.com/) early on. Now called [Genius](http://www.genius.com), the site offers much more than just annotated song lyrics. We will take a closer look later.

### Web Annotation Architecture
*How do web annotations work?* This **[InfoGraphic!](https://www.w3.org/annotation/diagrams/annotation-architecture.svg)** models the architecture of web annotation systems.

###Web Annotation Data Model
The technical details of how web annotations work are laid out in the [The Web Annotation Data Model](https://www.w3.org/TR/annotation-model/). This W3C working draft describes a framework for sharing annotations across platforms. It describes bodies, targets, annotations and specificResources as entities in the graph of relationships produced by web annotations. Feel free to read this document at the link above, and annotate ii using your new Hypothes.is account.
 
##Use Cases for Web Annotations
###This Workshop/Blog Post
This presentation uses [Hypothes.is](https://hypothes.is/groups/JEQoYxZJ/web-annotations-workshop) to explain and demonstrate web annotation tools. Participants are encouraged to use the Hypothes.is tool as a way to engage with the presentation content and to practice with a new technology.

###Pedagogy
* [Collaborative Learning](http://www.sciencedirect.com/science/article/pii/S0360131510000886)
* This post on the Chronicle of Higher Education's ProfHacker blog discusses using web annotation tools in the classroom: [How Do You Annotate in Your Class? by Lee Skallerup Bessette](http://chronicle.com/blogs/profhacker/how-do-you-annotate-in-your-class/60101)
* Applications for MOOCs? Blackboard?
* [#Education Genius](http://genius.com/static/education)
* [Hypothes.is/Education](https://hypothes.is/education/)

###Open Research
* Scholarly Communications - [video @4:40](https://hypothes.is/annotating-all-knowledge/)
* [Sharing](http://onlinelibrary.wiley.com/doi/10.1002/asi.23124/abstract) annotations made during the research process
* Public Scholarship - [An astronomer discusses a poem about the sunset.](http://genius.com/789992)
* Commenting on published research
* Open peer review?
* [Reading group](https://hypothes.is/groups/nwQKV3WM/vu-scholcommreadinggroup)
* Data?

###What Else?
* Add annotations to this page with your own ideas for how this technology might be used. Use the tag *[useCase*](https://hypothes.is/stream?q=tag:%27usecase%27).

##Examples
###Genius.com
[Genius.com](http://genius.com) grew out of RapGenius a site where the user community analyzed song lyrics. It has grown into an impressive site which collects and annotates documents of all sorts.

(Code is available)[http://genius.com/web-annotator] to embed genius annotation functionality in your own website. Or you could use the genius.com interface to annotate documents on the site. [Support for educators](http://genius.com/static/education) is available for using genius.com with students. A [WordPress](https://wordpress.org/plugins/genius/) plugin is also available.

One corpus of note is the collection of President Obama's [State of the Union](http://genius.com/a/the-white-house-annotates-with-genius) addresses annotated by White House staff.
###Hypothes.is
[Hypothes.is](https://hypothes.is/about/) is a non-profit, open source project supported by the Knight, Mellon, Shuttleworth, Sloan and Helmsley Foundations. It is built on the open source [Annotator](http://annotatorjs.org/) project. [Support for educators](https://hypothes.is/education/) is available. A [WordPress](https://wordpress.org/plugins/hypothesis/) plugin is also available.

[Ed Warga](https://hypothes.is/stream?q=user:acct:EdWarga@hypothes.is) uses Hypothes.is! You can participate too by creating a user account and installing the Chrome extension or bookmarklet.

###Annotator
For the developers, [Annotator](http://annotatorjs.org/) provides open source software and plugins.

###Lacuna Stories
[Lacuna Stories](http://www.lacunastories.com/) is a university classroom tool.

###Annotation Studio
[Annotation Studio](http://www.annotationstudio.org/) is currently under development at MIT.

###More Tools
[The Web Annotations](https://en.wikipedia.org/wiki/Web_annotation) Wikipedia article includes a list of annotation tools and their features.

##Thank You!
Thank you for participating in the annotation activities described in this post. Please feel free to provide feed back by annotating here with your comments.