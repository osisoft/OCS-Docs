---
uid: RetrieveDataViews
---

# Retrieve Data Views with Power BI Connector

Use OSIsoft Cloud Services Power BI Connector to retrieve OCS data views for use in Microsoft Power BI.

To retrieve data views:

1. In Microsoft Power BI Desktop, in the entry field of the `Get Data` window, type `OSI`.<br>The OSIsoft Cloud Services Data Views connector file displays in the `All` pane.

   ![Get Data](../../analytics/data-views/_images/get-data.png)

1. Select the `OSIsoft Cloud Services Data Views` connector file, and then select **Connect**.

1. Select **Continue** in the `Connecting to a third-party service` warning.

1. In the `OSIsoft Cloud Services Data Views` window, enter the tenant and namespace for the data views you want to access, and then select **OK**.

   The OSIsoft Cloud Services sign-in window displays if you have not already signed in.

   - If you have not already signed in, select **Sign in as different user** and complete the user authentication process.

1. In the `OSIsoft Cloud Services Data Views` sign-in window, select **Connect**.

1. In the `Navigator` pane, do one of the following: 

   - To get data using the stored retrieval mode, select **Stored Data Views**, and then select the data view to work with in Microsoft Power BI. 
   
   - To get data using the interpolated retrieval mode, select **Interpolated Data Views**, and then select the data view to work with in Microsoft Power BI.

   ![Select Data Views](../../analytics/data-views/_images/click-data-view-box.png)

1. For stored data views, specify a Start Index and End Index in `YYYY-MM-DDTHH:mm:ss` format for the selected data view, and select **Apply** to save the values. For interpolated data views, also specify an Interpolation Interval in `dd.hh:mm:ss` format. Repeat for each additional data view as needed.

   **Note**: If a data view has default values, enter new values and select **Apply** to accept the defaults.

   ![Specify Data View Values](../../analytics/data-views/_images/specify-values.png)

1. Select **Load** at the bottom of the `Navigator` pane to load all selected data views to Microsoft Power BI.
