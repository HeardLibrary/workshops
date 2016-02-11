#Introduction to Data Cleaning with OpenRefine
####Friday, February 12


###About OpenRefine
- Downloadable from [http://openrefine.org/download.html](http://openrefine.org/download.html) 
- Originated at Metaweb Technologies, in 2010 the company was acquired by Google 
- Google Refine was developed and supported by Google (2010-2013), once Google support ended, it became known as OpenRefine
- Open source software with an active developer community extending functionality
- Code available on [Github]((https://github.com/OpenRefine/OpenRefine) ) 
- A standalone application- although you interact with data using a browser, it is not a web application- your data are stored locally

###Getting started with OpenRefine

- [Download software at http://openrefine.org/download.html]
- [Select the most recent stable version for your operating system- we are using version 2.5]
- [Decompress files] 
- Click on the OpenRefine diamond icon on your desktop to launch the software 
- This will open a browser window at http://127.0.0.1:3333/ and terminal window tracking your work

####Create a project

- Use the browser interface (if it does not open automatically, type http://127.0.0.1:3333/ in your web browser)
- For the rest of this workshop, we will be working with data from the [Tennessee Online Campaign Finance Database]((https://apps.tn.gov/tncamp-app/public/cesearch.htm)) for 2015  
- Get data from: this computer (select **TnCampaignContributions2015wkshp.csv** from the desktop) 
- Parse data- this is a .csv file- OpenRefine recognizes it, and identifies that the first row is column headers.  All settings can be kept as-is for this dataset.
- Click "create project"
- Note that only the first 10 rows of your data appear here.  Select "Show 50 records" to see a greater portion of the data
- Explore the columns and rows a bit to get familiar with the data

###Cleaning the Data
####White space issues
- A good practice working with data is to remove white space from your columns- extra spaces before or after your data can keep software from recognizing that two entries mean the same thing
- In the Recipient Name column: Edit cells > Common transformations > Trim leading and trailing white space

####Find inconsistencies in the Recipient Name data using Facet/ Filter
- In the dropdown for the column header "Recipient name," choose Facet > Text facet.  This groups all responses in that column
- Use the Facet/ Filter pane to look at discrepancies in that column
- Look at similar entries- do they mean the same thing?  Can/ should they be merged? (examples: AGL Resources; Anderson County Republican Party; Baker Donelson)

#####An easy way to deal with these inconsistencies
- In the Facet/ Filter pane, "Cluster" will suggest which responses are probably duplicates and allow you to merge them under a new name
	- If appropriate, click "Merge" next to each grouping.  You can edit the new cell value they will take on
	- Click on Merge selected and close
	- Now we can browse through this list and see if there are any other duplicates
- **Note: Undo/redo will roll back the data to a previous state** (this is true for any action you take in OpenRefine

#####A second way to deal with these inconsistencies
- Hover over entries in the Facet/ Filter pane and select "edit" to change the way those entries are listed in the data
- Now we can use the "Sort by: count" feature to look at the most frequent contribution recipients

####Dollar amounts
- Right now, OpenRefine recognizes the contribution amounts in our data as strings of text rather than numbers.  If we strip some extra characters and specify how we want that column read, we can do more.
- For Amount, Edit column > Add column based on this column
- Let's call this column AmountAsNumber
- Enter the code in GREL, the Google Refine Expression Language:
`substring(value,1)`
- This code reads the string beginning with the second character (getting rid of the $).  In GREL, the $ is in position 0
- We also need to get rid of the commas in the contributions of 1,000 or more
- In our new column AmountAsNumber, Edit cells > Transform
- Enter the GREL code: 
		`value.split(",").join("")`
- This splits the values at the commas, when present, removes the commas, and joins the number back together
- In the same column, select Edit cells > Common transformations > To number

####Exploring dollar amounts
- If we create a numeric facet in this column, we can see the range of contribution amounts, and filter rows based on that to see who the big spenders and big recipients were
- In the column AmountAsNumber, select Facet > Numeric Facet
- Use the slider to see the sources of contributions over $100,000.
	- Compare that with contributions over $50,000.
- We can also do this using the Sort function in this column
- Click "Remove all" in the Facet pane to see our un-filtered data again

####Let's see who made the largest number of campaign contributions
- First let's sort by contributor name to group contributions by the same person: in Contributor Name column, select Sort  
- In the pop-up window, keep defaults, but add sort by this column alone
- In the same column, select Edit column › Add column based on this column....
- Name the column "Contribution count" and enter this expression
	 `facetCount(value, "value", "Contributor Name")` 
- In the new Contribution count column, select Facet > Numeric facet
- Notice the image that appears in the Facet pane, showing the range of numbers of contributions 
- You can move this slider to view only part of the data- let's see who contributed the most often during this time period
- Click "Remove all" in the Facet pane to see our un-filtered data again

####Reformatting contributor addresses
- Let's say you want to see where contributors come from
- First, let's divide the addresses into their components
- In the Contributor Address column, choose Edit column > Split into several columns
- By separator: 
`<br/>`
- Split into 2 columns (divides address into Street address and City, State, Zip), de-select "Remove this column"
- Rename your new columns using Edit column> Rename this column.  Lets call them "Contributor Address Street" and "Contributor Address City State Zip"

####Contributions by state
- In the column Contributor Address City State Zip, choose Edit column > Split into several columns
	- By separator: (leave the comma here)
	- Split into 3 columns at most 
	- Deselect "Remove this column"
- Now let's rename the column with the state codes, to make it more self-explanatory Edit column > Rename this column (rename to Contributor Address State)
- Make Contributor State a text facet
- Sort by Count in the Facet pane to see which states other than Tennessee have residents that contributed money to TN elections


####Let's see which towns in Tennessee made the most campaign contributions
- Before we start, make sure you have cleared all filters.  Click "remove all" in the Facet/ Filter pane
- Let's filter our results to just look at Tennessee
- Contributor state column > Facet > Text facet
- Click on TN to see Tennessee only
- In the Contributor Address column showing towns, select Facet > Text facet
- Now select "Cluster" to see if there are any duplicate names (example: Chattanooga)
- Merge them into a new cell value
- "Merge selected and close"
- Sort by Count

####Further clean up addresses 
- In the column Contributor Address City State Zip, Edit cells > Transform
- Enter the GREL code: 
		`value.split(",").join("")`
- This splits the text at the commas, when present, removes the commas, and joins the text back together.  This transformation will be helpful when we map the data later on!

####Geolocating the data method 1. Geolocation lookup (A demo)
- There is an easy way to pull web data into OpenRefine
- I'm going to demo this function, since it takes a while to fetch the data, and if we all try it at the same time, it will take even longer
- First, I'll subset the data, so the data fetching takes less time
- By making an AmountAsNumber facet, I'll select contributions over $3000
- I want the whole contributor address for this, so I'll go back to the ContributorAddress column and with Edit cells > Transform make a quick formatting change:
`replaceChars(value, "`<br/>`", ", ")`
- Replaces `<br/>` with a comma (note the space after the comma).  Now the Google maps API will recognize these cells
- In ContributorAddress, Edit column > Add column by fetching URLs
- New column name: ContributorGeocode

`"http://maps.google.com/maps/api/geocode/json?sensor=false&address=" + escape(value, "url")`

- Once again, Edit column > Add column based on this column. Use the GREL expression 

`with(value.parseJson().results[0].geometry.location, pair, pair.lat +", " + pair.lng)`

####When you are done, export your data
- First, remove any active filters, so you'll export the entire dataset
- Select "export" and "comma-separated values" to download your improved dataset
- Save the file with a new name to disambiguate from the original file e.g. "TnCampaignContributions2015Refined.csv"

####Geolocating the data method 2. Using Google Maps to look at contribution sources
- One interesting thing we can do with our dataset is map it, to visualize contribution sources geographically
- Go to [Google Maps]((https://www.google.com/maps/d/u/0/)) at https://www.google.com/maps/d/u/0/
- Click on Create a New Map
- Select Import and "Select a file from your computer" to choose your cleaned-up file from your desktop
- When prompted to Choose columns to position your placemarks, select Contributor Address 2, which will grab the city, state, and zipcode from the file
- Next, you'll be prompted to Choose column to title your markers. Select Amount and click Finish
- There may still be some errors in the data.  You can clean them up here by clicking Open Data Table. Trailing white spaces and zip code formatting appear to be the culprit- let's fix them here
- Now customize your map- Use the Uniform Style option to color code your data.  Group places by "Style by data column" > "Amount"
- We can see all the places where a given amount was donated by clicking through the table

####More about OpenRefine
- [Download OpenRefine](http://openrefine.org/index.html), watch tutorials, and view documentation
- [OpenRefine recipes](https://github.com/OpenRefine/OpenRefine/wiki/Recipes), for things you may want to do with data
- [Cheat sheet](http://arcadiafalcone.net/GoogleRefineCheatSheets.pdf) for advanced users
- Tutorials and resources from [Open Refine](https://github.com/OpenRefine/OpenRefine/wiki/External-Resources) and from [Walker Boyle at the University of Michigan](https://github.com/walkerdb/dsc_workshops/tree/master/open_refine)
- The [Google Refine Expression Language](https://github.com/OpenRefine/OpenRefine/wiki/Google-refine-expression-language
) (code for working with data in OpenRefine) 
