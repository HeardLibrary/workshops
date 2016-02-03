---
layout: post
title:  "Getting Started with Extracting Data"
date:   2015-11-06 11:00:00
categories: tech
description: "There is an enormous amount of data available on the Internet to download, combine, and analyze. It can be difficult, though, to bring together data in different formats, from different sources, for analysis. In this session, we will try out tools for working with data from websites, in formats like .xls, .csv, and .pdf."
---

##Goals

There is an enormous amount of data available on the Internet to download, combine, and analyze. It can be difficult, though, to bring together data in different formats, from different sources, for analysis. In this session, we will try out tools for working with data from websites, in formats like .xls, .csv, and .pdf.

##Why Data Extraction?

Much has been written about the potential for open data to drastically change how people work in many fields, from a wide spectrum of research areas, to [business](http://www.theguardian.com/media-network/2015/aug/26/open-data-guide-tips-business), [government](https://www.data.gov/), and [activist](http://housing.datasf.org/?ref=brand) applications.  But data made available is not always easy to use: [poor data management](https://www.youtube.com/watch?v=N2zK3sAtr-4) may lead to reuse difficulties and datasets themselves may be locked in formats that are not amenable to reuse.  [Good data management](http://researchguides.library.vanderbilt.edu/datamanagement) is the responsibility of data creators, and there are several available sources for [guidance](http://datalib.edina.ac.uk/mantra/).  Data extraction, though, is in the hands of the user.


##Unlocking data from a pdf

Many organizations publish data in tables embedded in pdf documents, making them easy to read, but difficult to reuse.  Simple copy + paste functions often misread data or ignore important formatting. Fortunately, there are several tools we can bring to our aid in extracting tables from a pdf.  These three are free of charge (at least in trial form, in the case of PDFTables) and easy to use.

* [Tabula](tabula.technology/) is a free-to-download desktop application that extracts pdf table data to csv format.  Tabula opens a web browser when launched and prompts the user to upload a pdf, select the table of interest, and copy or download the newly formatted data.
* [PDFTables](https://pdftables.com/), a tool from [ScraperWiki](https://scraperwiki.com/), is web-based and requires a subscription (but offers a trial that allows the user to work with 3 pdfs free of charge).  
* [Cometdocs](http://www.cometdocs.com/) is a free, web-based tool where the user uploads their document of choice and receives a converted document in their choice of format via email.  While pdf to csv is one option, there are many other conversion possibilities. 

Why select one over the others?  It depends a great deal on the source pdf and your plans for the extracted data.  Tabula is terrific for files that combine text and tables, because it allows you to specify which tables you want to convert.  PDFTables and Cometdocs are better for pdf files that consist entirely of tables, or one big table, because these tools will convert the entire thing.  Your preference for browser, email, or stand-alone applications may influence your decision as well.

###Trying out pdf data extraction
Let's compare data extraction from Tabula and Cometdocs using one pdf, the [Annual Supplement to the Social Security Bulletin, 2013](https://www.socialsecurity.gov/policy/docs/statcomps/supplement/2013/supplement13.pdf)

* Download this pdf and save it to your computer's desktop

We are most interested in Table 6.A6—Number, percentage distribution, and average monthly benefit for retired and disabled workers, by state or other area, 2012, which is on pages 365-366 of the pdf.

#####Using Tabula

* First, you'll need to [download the software](http://tabula.technology/) and run it on your computer.  This will open a browser window in which Tabula runs.
* Under "Upload a pdf" click "Choose file" and navigate to the pdf you saved to your computer's desktop
* Heed the warning "Table auto-detection can be time-consuming" and make sure the "Auto-Detect Tables" box remains unchecked, since we only need one table from the pdf
*  Clicking on the "Submit" button will prompt Tabula to process the file
*  Once Tabula has processed the pdf, you'll see the simple and helpful prompt "How to use: make a rectangular selection over a table on the PDF pages. That's it!" along with the advice "Hint: table headers are (still) problematic. Try to exclude it from your selection."
*  Use the navigation pane on the left side of the screen to scroll down to page 365 of the pdf
*  Once you've reached page 365, use your mouse to click on the top left portion of the table, holding it as you select the rest of the table on the page.  Note: Omitting the entire table header is a good idea, to avoid formatting problems.  You can add it during the final step.
*  Tabula will show you a preview of the table.  Select "copy to clipboard" to continue, then select Close
*  Use the navigation pane to go on to page 366 for the rest of the table and repeat the previous two steps to select and copy it
*  Now select "Download all data" to see a preview of your extracted table
*  Choose Download CSV, give the file a memorable name like "Table6.A6_Benefit_for_retired_and_disabled_workers_2012_SSB_Supplement_2013.csv" and Save it, then close the dialog window
*  You can open the file in Excel or other table editing software to make any needed formatting changes

#####Using Cometdocs

* Navigate your web browser to the [Cometdocs upload tool](https://www.cometdocs.com/file/manager)
* Click "Upload" and navigate to the Annual Supplement to the Social Security Bulletin pdf on your desktop
* Once the file appears in the Upload box, click and drag it down to the "Convert" tab
* Select "To Excel" for your selected format
* Enter your email address and choose Convert.  In a short while, you will receive an email with a download link to retrieve the Excel file
* When you download and open the file, you will note that the entirety of the document's text has been converted to an Excel file containing more than 28,000 rows
* You can search for table 6.A6 using Excel's find function

The two tools result in very different data extraction, as this exercise shows.  While Tabula allows you to select the tables of interest on an individual basis, Cometdocs transforms the entire file indiscriminately.  In your work, you'll want to select the tool that best meets your need for extracting data from a given pdf file.
  
##Scraping the web

A great tool for scraping web data is [import.io](https://import.io), a web-based tool that allows the user to simply input a URL and retrieve the data from a website.  Using the [Zillow listings for Nashville](http://www.zillow.com/nashville-tn/) as our URL, we can easily download a CSV of current home listings on the site.  Note, however, that the tool allows download of only 20 pages of data at a time.  By extracting the dataset, a prospective home buyer can sort, filter, and query it in ways not supported by the website.

##APIs

Application programming interfaces (APIs) allow a user to exchange data with a website programmatically.  Connecting to an API can be very different from website to website- it takes some time to research a particular site's method for connecting and to write a query that will return the results you need.  This workshop did not include hands-on interaction with an API in order to avoid surpassing service rate limits for any particular site.  Instead it presented a few rules of thumb for working with an API:

* Read the documentation, it may provide sample code and queries
* Documentation will specify the endpoint to which you'll address your query- it will like be a URI: Uniform Resource Identifier
* Request an API key: A password that will let you connect
* Respect web service rate limits specified in the documentation- the number of requests you can make to a server within a given time period




##More tools and information

* [Reviews](https://datatools.quora.com/) of Data Tools
* The [Four Kinds of Data PDF](https://blog.scraperwiki.com/2015/08/the-four-kinds-of-data-pdf/)
* [Quandl](https://www.quandl.com/): Finance and economic data for download or use with the Quandl API
* [OpenRefine](http://openrefine.org/) for working with messy data.  See also the Vanderbilt Libraries Digital Scholarship [OpenRefine Workshop](https://github.com/HeardLibrary/workshops/tree/master/OpenRefine)

<br/>
------
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Getting Started with Extracting Data</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/MorganDaniels" property="cc:attributionName" rel="cc:attributionURL">Morgan Daniels </a> / Vanderbilt University is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.<br />

