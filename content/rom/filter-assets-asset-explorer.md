---
uid: FilterAssets
---

# Filter assets in the Asset Explorer

Monitor and manage assets by applying filters in the Asset Explorer. Filters allow you to find specific assets quickly regardless of how many assets your organization has. Customize and refine your search filter by selecting multiple filter values. Your view of assets is saved within a session or between sessions. Use metadata filters to refine your search using these filter facets:

- Status &ndash; Filter for assets that have the same status. For example, filter for assets with a status of `Warning` or `Bad` to identify assets that may need attention.

- Asset Type &ndash; Filter for assets based on asset type.

- Metadata &ndash; Filter for assets based on metadata, such as `Location`, `Manufacturer`, `Province` or `State`, `Region`, or `Model`.
 
To filter assets in the Asset Explorer, follow these steps:

1. In the left pane, select **Visualization** > **Asset Explorer**. 

1. Verify that the **Assets/Asset Type** selector is set to **Assets**.

1. Select the **Metadata Filters** icon ![Filter icon](../_icons/branded/filter.svg) to open the `Metadata Filters` pane.

   - Status and Asset Type always appear at the top of the filter facets list. 

   - The remaining metadata facets appear in order, with the most frequently occurring facet first, followed by the remaining facets in descending order. 

   - The first ten values of each facet are displayed. If there are more than ten values, select **Show More** to see the complete list of values. 
   
1. Enter the name of the metadata facet in the **Search** field to find a particular facet.

1. Select one or more values from one or more facets to apply the filters to the listed assets.

   If you select multiple choices within a facet, an **Or** operator is used. For example, if you filter on status values of `Warning` and `Bad`, assets that have a status of `Warning` or a status of `Bad` appear. Across facets, an **And** operator is used. For example, if you filter on status value of `Bad` and an asset type of `GE Wind Turbine`, only assets that have both values appear. As you select facet values, the assets that match the values are updated and displayed in real time. The asset search chips appear in the menu bar so you can see how the asset view is filtered. 

   Apply multiple filters in combination to create a unique view for your fleet of assets. For example, you could set filters to see assets that have a status of `Good`, are based on the `GE Wind Turbine` asset type, and are either in the `NA` or `NAMER` region. 
   
1. (Optional) To remove a facet filter, select the **X**, or to remove all facet filters, select **Clear All**. 
