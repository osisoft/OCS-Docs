---
uid: gsDataViews
---

# Get started with data views

Data views are user-selected subsets of data from one or more streams stored in OSIsoft Cloud Services (OCS), mapped into custom tables. For more information about data views, see the [Data Views](xref:DataViews).

To create a data view:

1. In the left pane, select **Analytics** > **Data Views**.

1. In the `Data Views` pane, select **Add Data View**.

1. Complete the following fields:

   - **Name** - Enter `MyDataView`.

   - **Description** - (Optional) Enter a description for the data view.

1. Select the **Standard** for the **Data View Shape** for the general shape of the data display.

1. In the center pane, select the default of *Query1* for the **Query Id** field.

1. For **Query Type**, select **Streams**.

1. For the **Query Value** search field, enter a portion of the name of any known stream preceded or followed by the wildcard operator (_*_), and then select **Search** to search for available streams.

1. Select any stream in the query results to display and view the individual data fields to the pane on the right.

1. Select **Save** to accept the query results as the basis of the data view.

1. In the `Add Data Fields` window, select data fields to use as identifying fields. **Show Included Fields** highlights identifying fields already included in the data field.

1. Select **Apply** to accept the selected data field.

   The `Filter Fields` and `Generate Preview` panes display.

1. In the `Filter Fields` pane, the **Index Field** and **Grouping Fields** sections are set by default. In the queries section, each data field previously selected in the `Add Data Fields` pane is listed as an identifying field.

1. In the `Generate Preview` pane, turn the **Auto Refresh** toggle switch on to enable auto refresh. With auto refresh enabled, changes to any of the streams included in the data view are immediately reflected in the data view.

1. Select the date and time display to set the **Start Index** and **End Index** to enter the time period of the data to include in the data view. For interpolated data views, enter a `Time Interval`.

1. Select **Apply** to accept the index configuration changes.

1. Select the **Interpolated/Stored** dropdown list and select **Interpolated** or **Stored** for the data view.

1. Select **Generate preview** to generate a preview of the data view with the selected settings.

1. Select **Save and Close** to create the data view and exit.

## Next step

Continue with [Get started with metadata rules](xref:gsMetadataRules).
