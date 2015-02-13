##Directions
1.  Go to [Mapbox](https://www.mapbox.com/) and create a free account.
2.  Download and install [TileMill](https://www.mapbox.com/tilemill/).
3.  Open TileMill
4.  Click "Settings" and authorize your new Mapbox account within TileMill.
5.  Click Projects and create a new project.
6.  Give your project a name and accept the default settings.
7.  Click your new project to open it.
8.  Once in your new project, you will go to the right hand side of the window and disable autopilot.  Normally autopilot would be good to use for beginners, but in this case we need to disable it so that we can create our custom map settings. IF YOU DO NOT SEE THE DISABLE BUTTON. THEN THERE IS NOTHING YOU NEED TO DO.
9.  Go to the bottom left of the map and select the layer symbol.  Click "Add layer".
10. Click "File" and "Browse".  Browse for the location where you have saved your historic map and click "Done".
11. Change the SRS dropdown to WGS1984.  This is how we set the projection of the datasource, or in this case, our historic map.  
12. Click "Save & Stlye".  This step is critical.  If you do not set the style then your map will not display.
13. In the right sidebar delete everything under autopilor.mss EXCEPT for the information pertaining to your map.  (For example-- do not delete where it says ``` #1936 {raster-opacity:1;}) ```
14. Click "Export">"Upload".
15. Pan to your historic map and zoom in.  This part might take some time.  It can be difficult to find your map.  
16. Once you have located your map, hold down shift + drag the bounds to fit your map.
17. Click the center of your map to set the zoom level (once you have zoomed to a desired level.
18. Name your map.
19. Change the zoom slider on the right sidebar to match 13-18.
20. Set your "MetaTile size" to 1.
21. Click "Upload".
22. Once the upload is complete, go to your mapbox account.
23. Click "Data".
24. Click "Create Project".
25. Once in your project, select a basemap.
26. Click in the map frame and zoom to your historic map.
27. Click "Project" in the top menu bar.
28. Copy your MapID.
29. Open Atom and the map.js file from your github folder.
30. Paste the MapID into the appropriate area (currently there is a place holder that says vulibrarygis.##### - this is where your MapID goes).
31. Click Save.
32. Open idex.html and you should see your historic map!
