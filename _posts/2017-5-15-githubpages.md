---
layout: post
author: "Suellen Stringer-Hye"
title:  "Getting Started with Building a Free Website using GitHub Pages"
date:   2016-06-01 09:00:00
categories: edtech
description: "In this lesson, you will learn how to use GitHub Pages to create a static HTML website with all the benefits of version control. We’ll also take a look at Jekyll, a tool for generating websites from Markdown."
---
In this lesson, you will learn how to use GitHub Pages to create a static HTML website with all the benefits of version control. We’ll also take a look at Jekyll, a tool for generating websites from Markdown. Jekyll is now built into Github making it much easier to use Jekyll themes. By the end, you’ll be ready to create your own website for coursework or scholarly projects.




There are many ways to create a website depending on your needs. But a very simple way to build a free, but fully functional website is to leverage the capapbilites of Github and Jekyll. You will then maintain control over your own informtion and won't need to pay hosting or maintenance fees.



### What is Git?

Git is a version control system that tracks changes to files in a project over time. This is very useful when collaborating with other coders. It is also helpful in restoring earlier versions of a file should you need to.





### What is Github




GitHub is a web hosting service for the source code of software and web development projects (or other text based projects) that use Git. This code can be then shared with others who are either working on a project with you or would like to download your code for there own purposes.

### Why would I want to use Github to build a website?

Static websites are good when you just want to put up some documentation or simple information about yourself or organization. Github  allows you to do this without having to find a server to host the webpages. You can do this for free, it is easy to maintain and track changes in your website due to the versioning qualities of Github. This is especially useful if multiple people will be collaborating on the site.


### What are Github Pages?

GitHub Pages are a way to host webpages fro free using GitHub. Once you are signed in to GitHub you can create and host a personal website (one allowed per user) or websites related to specific GitHub projects. Github pages use either HTML or Markdown.

### What is Markdown?

Markdown is a lightweight markup language with plain text formatting syntax.

### Building your first website

#### Set up the repository
 Login to your GitHub account and go to <a href="https://github.com/new">https://github.com/new</a> or click the New repository icon from your account homepage.

![Imgur](http://i.imgur.com/C9XaJOb.png)

 Name your repository <code>username.github.io</code>, replacing <code>username</code> with your GitHub username. Make it  public and agree  to creating a <code>README</code> file once the repo is set up.

 ![Imgur](http://i.imgur.com/zfTCR7R.png?1)

##### Make a page
First make an <code>index.html</code> page by clicking the plus icon next to your repository name. You can then type the file name directly into the input box at the top.</p>

![Imgur](http://i.imgur.com/bfWfupP.png?1)

Then add the Markdown code <code>## Your Name</code>.

You can now view your webpage  at <a href="#">http://username.github.io</a>. It can often take up to 5-10 minutes before you can see it on the web.

### Getting Fancier: Using HTML

If you want to use html, delete the above code and add this code instead.
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Your Job Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/lighter.css" rel="stylesheet">
  </head>
  <body><h1> Your Name</h1>
    </body>
    </code>
```
This is a basic html web page with an outside link to a bootstrap stylesheet that will render your page with formatting and styles controlled by that css file. If you want to customize the css, copy the css file into a new folder named css, adapt it for your purposes and then change the pointer in the html code to the css directory.



### Getting fancier still: What is Jekyll?
GitHub Pages is deeply integrated with Jekyll, a popular static site generator designed for blogging and software documentation, but used for much more. Jekyll makes it easy to create site-wide headers and footers without having to copy them across every page. It also offers advanced templating features, the option to quickly create a new Jekyll site with the Jekyll Theme Chooser, and Jekyll theme support.


#### Jekyll Theme Chooser

Under your repository name, click  Settings.

Under "GitHub Pages", click Choose a theme.

![Imgur](http://i.imgur.com/dh2ok85.png?1)

On the theme selection page, review your theme options. To choose a theme, click the theme you want and then click Select theme.

https://help.github.com/articles/creating-a-github-pages-site-with-the-jekyll-theme-chooser/

#### Using Jekyll templates
https://github.com/jekyll/jekyll/wiki/Themes

To further enhance your website, there are many downloadable Jekyll themes. Once you download and add files to your github pages repository, you can then go into the code and modify for your own purposes. 

https://jekyllthemes.io/
http://jekyllthemes.org/


Once you have launched your site, you may want to polish things up a bit. You may even want to purchase a custom domain> Once you have done that, redirect your site under the settings tab. 

![Imgur](http://i.imgur.com/82yh9cy.png?1)

### Conclusion
Now that you have a basic website up and running, you can enhance your web presence further by  adding  a blogging component using Jekyll. This allows you to create posts in either Markdown or HTML and have them automatically appear with the styles associated with your website. 


### Useful Links

* Github pages templates: [http://tilomitra.github.io/prettypages/](http://tilomitra.github.io/prettypages/)
* Fork and Go: [http://jlord.us/forkngo/](http://jlord.us/forkngo/)

#### Official Documentation
* Git: [http://git-scm.com/](http://git-scm.com/)
* GitHub: [http://github.com](http://github.com)
* GitHub Pages: [https://pages.github.com/](https://pages.github.com/)
* Jekyll: [http://jekyllrb.com/](http://jekyllrb.com/)
* Markdown: [http://daringfireball.net/projects/markdown/](http://daringfireball.net/projects/markdown/)

#### Tutorials
* [Using Jekyll with Pages (from Github Help)](https://help.github.com/articles/using-jekyll-with-pages/)
* [Creating and Hosting a Personal Site on GitHub](http://jmcglone.com/guides/github-pages/)
* [Get Started With GitHub Pages (Plus Bonus Jekyll)](http://24ways.org/2013/get-started-with-github-pages/)

#### Examples sites using  Github Pages and Jekyll

* [Short list of sites using Jekyll](http://jekyllrb.com/docs/sites/)
* [Long list of sites using Jekyll](https://github.com/jekyll/jekyll/wiki/Sites)




