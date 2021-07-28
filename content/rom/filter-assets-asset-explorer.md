---
uid: FilterAssets
---

# Filter assets in the Asset Explorer

You may have hundreds or thousands of assets in your organization. To efficiently monitor and manage them, it is important that you can quickly find the assets you are interested in. 

The metadata filters allow you to refine your search using these filter facets:

-  Status &ndash; Filter for assets that have the same status, for example, assets whos status is Warning or Bad, thus allowing you to quickly identify assets that may need attention.
-  Asset Type &ndash; Filter for assets based on their asset type 
- Metadata &ndash; Filter for assets based on their metadata, for example, Location, Manufacturer, Province or State, Region, or Model.

By selecting several values, you can customize and refine your search filter to find exactly the assets you are interested in. 

## Procedure

This procedure describes how to use filters to find the assets you are interested in.

1. Click the ![Metdata filter icon](images/metadata-filter-icon.png) icon to open and close the metadata filters pane.

   - Status always appears at the top of the filter facets list. 

   - The remaining metadata facets appear in order, with the most frequently occurring facet appearing first, followed by the remaining facets in descending order. In the screen capture below, the Wind Farm facet most frequently occurs in the assets. 

     <!--WRITER'S NOTE: This might change so that Asset Type always follows Status. If so, the screen captures below will also have to be updated. -->

   - The first ten values of each facet is displayed. If there are more than ten values, a **Show More** button allows you to see the complete list of values. 

     ![Facet List](images/facet-list.png)
   
2. Start entering the name of the metadata facet in the **Search** field to find a particular facet.

3. Select one or more values from one or more facets to apply the filters to the listed assets.

   If you select multiple choices within a facet, an **Or** operator is used. For example, in the screen capture below, the assets must belong to either the NA and NAMER regions. Across facets, an **And** operator is used. In the example below, the assets must have one of the selected values for the Status, Asset Type, and Region facets. As you select facet values, the assets that match the values are updated and displayed in real time. The asset search chips appear in the menu bar so you can see how your asset view is filtered. 

   The screen capture below shows how you can apply multiple filters in combination to create a unique view for your fleet of assets. The assets displayed have a status of Good, they are based on the GE Wind Turbine asset type, and the assets are either in the NA or NAMER region. 

   **Note:** Wind Farm is the most frequently occurring facet on the assets. However, it is not being used to filter this asset view.
   
   ![Metadata filters](images/metadata-filters.png)
   
   Click the **X** to remove a facet or remove all facets by clicking **Clear All**. 
   
   This view of your assets is saved within a session or between sessions. 

