---
layout: post
title:  "Getting Started with Online Mapping"
date:   2015-09-18 11:00:00
categories: tech
description: "Learn basic mapping terminology, learn how to create an online map, and share your work with others."
---

##Goals

  * Cover basic mapping terminology
  * Review the various resources that are available for creating an online map  
  * Be able to understand the basics concepts needed to create and share an online map

##Basics of GIS Terminology

  * What is GIS?
    -A Geographic Information Systems (GIS) is a suite of softwares and technologies that are used to collect, create, maintain, store, change, analyze, and display geographically referenced data.  Geographically referenced data can be any location referenced by either a coordinate, address, or any other identifying piece of information that can be used to reference a point to a known geographic location.
  * Information about a location is referred to as an attribute
![Imgur](http://i.imgur.com/z5FKhjm.png)
  * This information is stored in a shapefile and displayed as layers
  * Shapefiles can be represented in multiple geometries:
     - Point
     - Line
     - Polygon (see below for example of census data displayed as a polygon)
![Imgur](http://i.imgur.com/parR3o9.png)    

##Online Mapping Resources

There are many online mapping options available, and this list is in no way all-inclusive.  Several mapping options include:

* [ArcGIS Online](https://www.arcgis.com/home/webmap/viewer.html?useExisting=1)
* [Mapbox](https://www.mapbox.com)
* [Google MyMaps](https://www.google.com/maps/d/)

##Acceptable Data Formats##
* CSV
* GPX
* KML
* Geojson (Mapbox)
* XLS (Google)
* Most tabular forms of data can be used or easily converted for use in an online mapping resource.  A correctly formatted table for GIS looks like the table below.  Keep in mind that not all fields are necessary but must have at least one type of georeferencing data (an address or latitude and longitude).
![Imgur](http://i.imgur.com/WaoXBtE.png)

##Create A Map With ArcGIS Online

**Creating an ArcGIS.com Account**

1.  Sign up for an [ESRI Global account](https://accounts.esri.com/signup)
2.  Go to [ArcGIS.com](http://www.arcgis.com/) and sign in to your account using your new ESRI global account.


**Creating an ArcGIS Online Map Using US Census Data**

1.  Click **Create Map**

2.  Zoom into the Nashville area and select **Basemap**. Spend a few minutes changing among basemaps.  There are many options to choose from.  Choosing a proper basemap can add aesthetic while also driving your point.  There are even ways to bring in custom basemaps.

3.  Click **Add Data**, and select **add layer from file**.  Select **choose file**.  Browse for the desktop and select **“ArcGISOnlineIntro”** and then select **“Tracts2010\_ACS.zip”** and **open**.

4.  Click **Import Layer**

5.  Next, we want to select the field we want to symbolize. Do this by selecting the **Choose an attribute to show** field and changing the drop down menu to “PctNoDiplo”. We will then be given the option to change the drawing style. Change it to the second option **Counts and Amounts (Size)** and then click **Options** to customize the symbols.

6. Here we will be configuring the way our symbols represent the value.  It will change to vary in size depending on the value for that polygon (or the value for Percent with No Diploma). Here, you can also change the way that the data is broken down by selecting **Classify Data Using** and choosing the method by which you want to break down the data.  Remember to also check that your size is broken down to cary from 8 to 30 (or any range that you like).  You can also select **Symbols** to change the color and fill of the dots.  When you are finished click **OK** and **DONE.**

7.  Repeat the process outlined in step 3.  We are going to add the same data a second time, only this time we will work on changing the symbology to represent the percent of the population below poverty.  You can do this by changing the dropdown **Choose an attribute to show** to **PctBelowPo.** Then select the first symbol option, **Counts and Amounts (Color)**.  Here we can break down our data in a similar way to what we did before.  By clicking **Symbols** you can change the color scale.  You can also change the way in which the data is broken down. When you are finish click **OK** and **Done** to return back to our layers window.

8.  Now that we have symbolized our data, we want to rearrange it so that the "dots" show up as the top layer.  Do this by hovering over the left side of the layer in the contents window until you see the mouse arrow change to a double crossed arrow.  Drag the top layer to the bottom.  Now it should be easier to see the dots on top of the polygons.

9.  Now we want to rename our layers so that they show up correctly in our legend to do this we will hover over each of the layers and click the **"..."** symbol on the layer you wish to rename.  A popup menu should show and rename should be one of the options that populates.

10.  Change the name to each of the layers that we edited to reflect the attributes that are displaying.  In this case our first layer (the one with the dots) should read “Percent with No Diploma”. Repeat the previous step for the second layer (in this case it should be the layer that we broke down base on a color gradient) and change the name to “Percent Below Poverty”.  To view your symbols and legend click the **"Legend"** option in the menu.

11.  Click **Save** at the top of the window. Name your map. You must enter all of the fields in order to save your document.  You should now have a complete map showing the population of Nashville by percentage with no diploma and percent below poverty.  Your map should look something like the one shown on the next page.

12.  From here you can choose options like **Share** and **Print.** You can also select new fields to display and change the symbology and labels however you choose. You can do this by selecting the drop down arrow next to the layer you want to change. Through the same workflow we can also add labels and popups to our map.
