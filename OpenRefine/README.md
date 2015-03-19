#Introduction to Data Cleaning and Preservation
####Friday, March 20


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
- This will open a browser window at http://127.0.0.1:3333/ and terminal window tracking your work

####Create a project

- Use the browser interface (if it does not open automatically, type http://127.0.0.1:3333/ in your web browser)
- Get data from: this computer (select **TnCampaignContributions.csv** from the desktop)
	- Data from the Tennessee Online Campaign Finance Database https://apps.tn.gov/tncamp-app/public/cesearch.htm 
- Parse data- this is a .csv file- OpenRefine recognizes it, and identifies that the first row is column headers.  All settings can be kept as-is for this dataset.
- Click "create project"
- Note that only the first 10 rows of your data appear here.  Select "Show 50 records" to see a better portion of the data

###Cleaning the Data
####Find inconsistencies in the Recipient Name data using Facet/ Filter
- Create a text facet from a column:
- Select the column header "Recipient name" to filter the data table (this groups all responses in that column)
- Use the Facet/ Filter pane to look at discrepancies in that column
- Look at similar entries- do they mean the same thing?  Can/ should they be merged? (example ACTBLUE TENNESSEE/ TENN/ TN)

####White space issues
- A good practice working with data is to remove white space from your columns- extra spaces before or after your data can keep software from recognizing that two entries mean the same thing
- In the Recipient Name column: Edit cells > Common transformations > Trim leading and trailing white space

#####An easy way to deal with these inconsistencies
- In the Facet/ Filter pane, "Cluster" will suggest which responses are probably duplicates and allow you to merge them under a new name
	- If appropriate, click "Merge" next to each grouping.  You can edit the new cell value they will take on
	- Click on Merge selected and close
	- Now we can browse through this list and see if there are any other duplications
- **Note: Undo/redo will roll back the data to a previous state** (this is true for any action you take in OpenRefine
#####A second way to deal with these inconsistencies
- Hover over entries in the Facet/ Filter pane and select "edit" to change the way those entries are listed in the data
####Now we can use the "Sort by: count" feature to look at the most frequent contribution recipients

####Dollar amounts
- Right now, OpenRefine recognizes those contribution amounts as strings of text rather than numbers.  If we strip some extra characters and specify how we want that column read, we can do more.
- For Amount, Edit column > Add column based on this column
- Let's call this column AmountAsNumber
- Enter the code in GREL, the Google Refine Expression Language:
substring(value,1)
- This code reads the string beginning with the second character (getting rid of the $).  In GREL, the $ is in position 0
- We also need to get rid of the commas in the contributions of 1,000 or more
- In our new column AmountAsNumber, Edit cells > Transform
- Enter the GREL code: value.split(",").join("")
- This splits the values at the commas, when present, removes the commas, and joins the number back together
- In the same column, select Edit cells > Common transformations > To number
- If we create a numeric facet in this column, we can see the range of contribution amounts, and filter rows based on that to see who the big spenders and big recipients were
	- We can also do this using the Sort function in this column
- Click "Remove all" in the Facet pane to see our un-filtered data again

####Let's see which people made the most campaign contributions
- First let's sort by contributor name to group contributions by the same person: in Contributor Name column, select Sort  
- In the popup window, keep defaults, but add sort by this column alone
- In the same column, select Edit column › Add column based on this column....
- Name the column "Contribution count" and enter this expression
- facetCount(value, "value", "Contributor Name") 
- In the new Contribution count column, select Facet > Numeric facet
- Notice the image that appears in the Facet pane, showing the range of numbers of contributions 
- You can move this slider to view only part of the data- let's see who contributed the most often during this time period
- Click "Remove all" in the Facet pane to see our un-filtered data again
####Reformatting contributor addresses
- Let's say you want to see what states Tennessee contributors come from
- First, let's divide the addresses into their components
- In the Contributor Address column, choose Edit column > Split into several columns
- By separator: 
`<br/>`
- Split into 2 columns (divides address into Street address and City, State, Zip), de-select Remove this column
- In the new column Contributor Address 2, choose Edit column > Split into several columns
- By separator: (leave the comma here)
- Now let's rename the column with the state codes, to make it more self-explanatory Edit column > Rename this column (rename to Contributor State)
- Make Contributor State a text facet
- Sort by Count in the Facet pane to see which states other than Tennessee have residents that contributed money to TN elections


####Let's see which towns in Tennessee made the most campaign contributions
- Before we start, make sure you have cleared all fiters.  Click "remove all" in the Facet/ Filter pane
- Let's filter our results to just look at Tennessee
- Contributor state column > Facet > Text facet
- Click on TN to see Tennessee only
- In the Contributor Address column showing towns, select Facet > Text facet
- Now select "Cluster" to see if there are any duplicate names
- Merge them into a new cell value
- "Merge selected and close"
- Sort by Count


####Geolocation lookup: A demo
- There is an easy way to pull web data into OpenRefine
- I'm going to demo this function, since it takes a while to fetch the data, and if we all try it at the same time, it will take even longer
- First, I'll subset the data, so the data fetching takes less time
- By making an AmountAsNumber facet, I'll select contributions over $3000
- I want the whole contributor address for this, so I'll go back to the ContributorAddress column and with Edit cells > Transform make a quick formatting change:
replaceChars(value, "`<br/>`", ", ")
- Replaces `<br/>` with a comma (note the space after the comma).  Now the Google maps API will recognize these cells
- In ContributorAddress, Edit column > Add column by fetching URLs
- New column name: ContributorGeocode

"http://maps.google.com/maps/api/geocode/json?sensor=false&address=" + escape(value, "url")

- Once again, Edit column > Add column based on this column. Use the GREL expression 

with(value.parseJson().results[0].geometry.location, pair, pair.lat +", " + pair.lng)

####When you are done- export your data
- Select "export" and "comma-separated values" to download your improved dataset
- Save the file with a new name to disambiguate from the original file e.g. "TnCampaignContributionsRefined.csv" or "TnCampaignContributions032015.csv"

####More about OpenRefine
- Download OpenRefine, watch tutorials, and view documentation: http://openrefine.org/index.html
- OpenRefine recipes, for things you may want to do with data: https://github.com/OpenRefine/OpenRefine/wiki/Recipes
- Cheat sheet for advanced users: http://arcadiafalcone.net/GoogleRefineCheatSheets.pdf
- Tutorials and resources: https://github.com/OpenRefine/OpenRefine/wiki/External-Resources
- The Google Refine Expression Language (code for working with data in OpenRefine) https://github.com/OpenRefine/OpenRefine/wiki/Google-refine-expression-language
