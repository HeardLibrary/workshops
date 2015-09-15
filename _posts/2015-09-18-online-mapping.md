---
layout: post
title:  "Getting Started with Maps"
date:   2015-09-18 11:00:00
categories: tech
---

##Goals

**Goals in this session are to:**
  * Cover basic mapping terminology
  * Review the various resources that are available for creating an online map  
  * Be able to understand the basics concepts needed to create and share an online map

##Basics of GIS Terminology

  * What is GIS?
    -A Geographic Information Systems (GIS) is a suite of softwares and technologies that are used to collect, create, maintain, store, change, analyze, and display geographically referenced data.  Geographically referenced data can be any location referenced by either a coordinate, address, or any other identifying piece of information that can be used to reference a point to a known geographic location.
  * Information about a location is referred to as an attribute
  ![Attribute](http://imgur.com/z5FKhjm)
  * This information is stored in a shapefile and displayed as layers
  * Shapefiles can be represented in multiple geometries:
     - Point
     - Line
     - Polygon (see below for example of census data stored as a polygon)
  ![Table to Map Polygon](http://imgur.com/parR3o9)    
     
##Online Mapping Resources

There are many online mapping options available, and this list is in no way all-inclusive.  Several mapping options include:

* [ArcGIS Online](https://www.arcgis.com/home/webmap/viewer.html?useExisting=1)
* [Mapbox](https://www.mapbox.com)
* [Google MyMaps](https://www.google.com/maps/d/)
* [ZeeMaps](https://www.zeemaps.com)

##Create A Map With ArcGIS Online

**Creating an ArcGIS.com Account**

1.  Sign up for an [ESRI Global account](https://accounts.esri.com/signup)
2.  Go to [ArcGIS.com](http://www.arcgis.com/)
    and sign in to your account using your new ESRI global account.


**Creating an Online Map Using US Census Data**

1.  Click **Create Map**

2.  Zoom into the Nashville area and select **Basemap**. Spend a few
    minutes changing between basemaps.
    
    - There are many basemaps to choose from.  Choosing a proper basemap can add aesthetic while also driving your point.  There are even ways to bring in custom basemaps.

3.  Click **Add Data**, and select **add layer from file**.  Select **choose file**.  Browse for the desktop and select **“ArcGISOnlineIntro”** and
    then select **“Tracts2010\_ACS.zip”** and **open**.

4.  Click **Import Layer**

5.  Repeat 3 through 4 so that when you are complete there are two
    **“Tracts2010”** layers.

6.  Once the Tracts 2010 layer has been added twice then we can begin
    the process of examining our data and changing symbology. To examine
    your data hover over the layer until the second symbol **Show Table** appears and click it.

7.  Spend a few minutes browsing through the fields to see what type of
    data is available for use. Once you are finished browsing the data hide the table.

8. Hover over your layer again and select the third symbol, **Change Style**

9. Click the first option **Counts and Amounts (Size)** 

10.  Next, we want to select the field we want to symbolize by size. Do this by selecting the **Choose an attribute to show** field and changing the drop down menu to “PctNoDiplo”. This will change our polygons to be
represented by dots varying in size depending on the value for that polygon (or the value for Percent with No Diploma). Here, you can also change the way that the data is broken down by selecting
**Classift Data Using** and choosing the method by which you want to break down the data.  Remember to also check that your size is broken down to cary from 8 to 30.

11.  Click **Symbols** icon and select the way in which you want to represent your data.  Here you can pick the type of symbol and also change the fill and outline of your symbols.  CLick **OK** and **DONE**.

12.  Now we want to change the symbology for the second symbol.  Hover over the second dataset and click on the third symbol, **Change Symbols**

13. **Choose an attribute to show** should read “PctBelowPo”. This will change our tract polygons to be varying shades of color depending on the values for that tract, or in this case, the value of percent below poverty.  If your dropdown does not say this, please change it now.

14.  Select the first option, **Counts and Amounts (Color)**.  Here we can break down our data in a similar way to what we did before.  By clicking **Symbols** you can change the color scale.  You can also change the way in which the data is broken down. When you are finish click **OK** and **Done** to return back to our layers window.

15.  Now we want to rename our layers so that they show up correctly in our legend to do this we will hover over each of the layers and click the last symbol **...** on the layer you wish to rename (rename should be one of the options that populates)

16.  Change the name to each of the layers that we edited to read the attributes that they are displaying.  In this case our first layer (the one with the dots) should read “Percent with No Diploma”. Repeat the previous
    step for the second layer (in this case it should be the layer that we broke down base on a color gradient) and change the name to “Percent Below Poverty”.

17.  Click **Save** at the top of the window. Name your map. You must enter all of the fields in order to save your document.

18.  In the menu at the top right of the map click **Legend.**

19.  You should now have a complete map showing the population of Nashville by percentage with no diploma and percent below poverty.  Your map should look something like the one shown on the next page.

20.  From here you can choose options like **Share** and **Print.** You can also select new fields to display and change the symbology and labels however you choose. You can do this by selecting the drop down arrow next to the layer you want to change. Through the same workflow we can also add labels and popups to our map.
