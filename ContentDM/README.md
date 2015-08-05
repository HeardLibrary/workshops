#Data Cleaning and Preservation
####Thursday, August 6, 2015


###About OpenRefine
- Downloadable from [http://openrefine.org/download.html](http://openrefine.org/download.html) 
- Originated at Metaweb Technologies, in 2010 the company was acquired by Google 
- Google Refine was developed and supported by Google (2010-2013), once Google support ended, it became known as OpenRefine
- Open source software with an active developer community extending functionality
- Code available on [Github]((https://github.com/OpenRefine/OpenRefine) ) 
- A standalone application- although you interact with data using a browser, it is not a web application

###Getting started with OpenRefine

- [Download software at http://openrefine.org/download.html]
- [Select the most recent stable version for your operating system- we are using version 2.5]
- [Decompress files] 
- Click on the OpenRefine icon  ![OpenRefine logo](http://127.0.0.1:3333/images/logo-gem-40.png) on your desktop to launch the software 
- This will open a browser window at [http://127.0.0.1:3333/](http://127.0.0.1:3333/) and terminal window tracking your work

####Create a project

- Use the browser interface (if it does not open automatically, type http://127.0.0.1:3333/ in your web browser)
- Get data from: this computer (select **DiscoverArchive_MetadataExport_20150728_Cleaned.csv** from the desktop)
	- Metadata from DiscoverArchive, Vanderbilt University's Institutional Repository [http://discoverarchive.vanderbilt.edu/](http://discoverarchive.vanderbilt.edu/)
- Parse data- this is a .csv file- Make sure you select: 
	- "Columns are separated by commas" 
	- "Parse next	1 line(s) as column headers"
		- These settings help OpenRefine read the data properly.
- Click "create project"
- Note that only the first 10 rows of your data appear here.  Select "Show 50 records" to see a larger portion of the data
- Look through the column headings to see what you're working with
- Several things to note: 
	- dc. column headers denote the use of Dublin Core metadata fields
	- Not all columns are filled for each row- there are plenty of null values
	- The use of the double vertical bar to separate more than one entry in the same cell: || (many examples in the dc.subject column)

###Exploring and cleaning the data

####Let's see which schools have made the most contributions to the institutional repository
- Let's sort by college to group contributions by the same unit: in dc.description.college column, select Sort  
- Sort cell values as text 
- a-z
- Click OK
- Now let's filter the results 
	- Click on menu for the column dc.description.college and select Facet> Text Facet
	- We see 25 choices sorted by name- many of them are duplicates.

######An easy way to deal with these inconsistencies
- In the Facet/ Filter pane, "Cluster" will suggest which responses are probably duplicates and allow you to merge them under a new name
	- Notice the difference between clustering methods by switching from Key Collision to Nearest Neighbor
	- If appropriate, click "Merge" next to each grouping.  You can edit the new cell value they will take on
	- Click on "Merge selected" and close
	- Now we can browse through this list and see if there are any other duplicates
- **Note: Undo/redo will roll back the data to a previous state** (this is true for any action you take in OpenRefine)

######A second way to deal with these inconsistencies
- Hover over entries in the Facet/ Filter pane and select "edit" to change the way those entries are listed in the data
- Now we can use the "Sort by: count" feature to look at the most frequent contributing schools

####What are the most common document types in DiscoverArchive?
- In the dc.type column, select Facet> Custom text facet
	- value.split("||")
	- This will facet the column looking at multiple values in cells separately
	- At the end of the facet, you'll see which rows have errors.  We can focus on these, to make the metadata more complete by entering a type for each item, or we can exclude these records, to focus on the types that have been entered.
	- There are two entries for "event program"- lets make it a single entry
	- Click on "Event program," which has 4 occurrences 
	- This pulls up the four rows with that spelling
	- Click on "edit" in the first "Event program" cell and change to "Event Program"- select apply to all identical cells
	- There is one occurrence of "podcasts"- change this to podcast and apply
	- Do the same with "text"
	- Refresh the facet to see the change in type counts
	- Then sort by count to see the most common content types
	- If we click on "Recording, oral," we'll see that many of these items are also podcasts
####Let's see which authors occur most frequently in DiscoverArchive
- Looking through the dc.contributor.author column, you'll notice that many of the items have multiple authors, separated by the double vertical bar ||
- OpenRefine can create a facet for each of these names separately
	- In the dc.contributor.author column, select Facet> Custom text facet
	- value.split("||")
	- OpenRefine counts the authors in this column returning the responses as a text facet
	- We get an error message because of the number of facets: "2823 choices total, too many to display, Set choice count limit"
	- Select "facet by choice counts" to see the author frequencies
	- Notice the image that appears in the Facet pane, showing the range of numbers of contributions. In that slider image, deselect "error"- these are our items without assigned authors
	- Use the slider to select authors that appear frequently in the dataset and sort by count.  You can move this slider to view only part of the data.
	- This lists the most frequent authors, but you'll notice there are some less frequent authors in the list- they are coauthors who published less in our dataset
- Click "Remove all" in the Facet pane to see our un-filtered data again

####White space issues
- A good practice working with data is to remove white space from your columns- extra spaces before or after your data can keep software from recognizing that two entries mean the same thing
- In the dc.title column: Edit cells > Common transformations > Trim leading and trailing white space

####When you are done- export your data
- Select "export" and "comma-separated values" to download your improved dataset
- Save the file with a new name to disambiguate from the original file e.g. "DiscoverArchive_MetadataExport_20150728_Refined.csv" or "DiscoverArchive_MetadataExport_20150806.csv"

####More about OpenRefine
- Download OpenRefine, watch tutorials, and view documentation: [http://openrefine.org/index.html](http://openrefine.org/index.html)
- OpenRefine recipes, for things you may want to do with data: [https://github.com/OpenRefine/OpenRefine/wiki/Recipes](https://github.com/OpenRefine/OpenRefine/wiki/Recipes)
- Cheat sheet for advanced users: [http://arcadiafalcone.net/GoogleRefineCheatSheets.pdf](http://arcadiafalcone.net/GoogleRefineCheatSheets.pdf)
- Tutorials and resources: [https://github.com/OpenRefine/OpenRefine/wiki/External-Resources](https://github.com/OpenRefine/OpenRefine/wiki/External-Resources)
- The Google Refine Expression Language (code for working with data in OpenRefine) [https://github.com/OpenRefine/OpenRefine/wiki/Google-refine-expression-language](https://github.com/OpenRefine/OpenRefine/wiki/Google-refine-expression-language)
- Reconcilable Data Sources: [https://github.com/OpenRefine/OpenRefine/wiki/Reconcilable-Data-Sources](https://github.com/OpenRefine/OpenRefine/wiki/Reconcilable-Data-Sources)