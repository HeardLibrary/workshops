---
layout: post
title:  "Getting Started with Maps"
date:   2015-09-18 11:00:00
categories: tech
---

##Goals

My goal in this session is to review the various resources that are available for creating an online map.  Some of the resources are free at the basic level and tier up in cost as usage increases.  By the end of this session you should be able to understand the basics concepts needed to create and share a map.

##Mapping Resources

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

3.  Click **Add Data**, and select **add layer from file**.

4.  Select **choose file**.

5.  Browse for the desktop and select **“ArcGISOnlineIntro”** and
    then select **“Tracts2010\_ACS.zip”** and **open**.

6.  Click **Import Layer**

7.  Repeat 5 through 9 so that when you are complete there are two
    **“Tracts2010”** layers.

8.  Once the Tracts 2010 layer has been added twice then we can begin
    the process of examining our data and changing symbology. To examine
    your data select the down arrow found to the right of your data
    layer and select **Show Table**.

9.  Spend a few minutes browsing through the fields to see what type of
    data is available for use.

10. Once you are finished browsing the data close the table.

11. Click the down arrow to the right of your first layer name and
    select **Change Symbols**

12. Click the down arrow next to **Use: A Single Symbol** and change the drop down to **Size**.

13.  Next, we want to select the field we want to symbolize by size. Do this by selecting the **To show** field and changing the drop down menu to “PctNoDiplo”. This will change our polygons to be
represented by dots varying in size depending on the value for that polygon (or the value for Percent with No Diploma). Here, you can also change the way that the data is broken down by selecting
**By**.

14.  Click **Options** and select **Change all symbols**. Change the color to yellow. Click apply and done.

15.  Click the **Details** button at the top of the menu to go back to our detailed view.

16.  Next click the down arrow to the right of the second **Tracts2010** layer.

17.  Again, select **Change Symbols**

18.  Change the **Use** drop down menu to **Color**.

19.  Change the **To Show** drop down to “PctBelowPo”. This will change
    our tract polygons to be varying shades of color depending on the
    values for that tract, or the value of percent below poverty.

20.  Select a color ramp and click **Apply.** Here you can also change
    the way the data is broken down by selecting **By** and changing the
    drop down menu.

21.  Click **Done Changing Symbols.**

22.  Click the **Details** button again at the top of the menu.

23.  Go to the first Tracts 2010 ACS and select the down arrow and select
    **Rename.**

24.  Change the name to “Percent with No Diploma”. Repeat the previous
    step for the second layer and change the name to “Percent
    Below Poverty”.

25.  Click **Save** at the top of the window. Name your map. You must
    enter all of the fields in order to save your document.

26.  In the menu at the top right of the map click **Legend.**

27.  You should now have a complete map showing the population of
    Nashville by percentage with no diploma and percent below poverty.
    Your map should look something like the one shown on the next page.

28.  From here you can choose options like **Share** and **Print.** You
    can also select new fields to display and change the symbology and
    labels however you choose. You can do this by selecting the drop
    down arrow next to the layer you want to change. Through the same
    workflow we can also add labels and popups to our map.
