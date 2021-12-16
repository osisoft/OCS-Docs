---
uid: GettingStartedWithTrendData
---

# View trend data

Use trace data in a trend to monitor assets, anticipate problems, and proactively perform preventative maintenance. Display traces in a trend to better understand the data and gather useful information from it.

To display traces in a trend, follow these steps:

1. In the left pane, select **Visualization** > **Trend**.
   
1. In the `Add Traces` pane, select either the **Assets** tab or the **Streams** tab, and then select the **+** sign to add the trace to the trend. 

   **Tips:**

     - To find assets, enter the asset name or description in the **Search** field on the **Assets** tab.

     - To find streams, enter the stream name or description in the **Search** field on the **Streams** tab.

     - To hide the pane and maximize the available area to display the trend after you have finished adding traces, click the **x** in the `Add Traces` pane.

    ![Search blade](images/Search_blade_75.png)
   
1. Select the **Change Y-axis Mode** icon ![Trend views icon](images/trend-views-icon.png) to choose one of the following views:

   - `Single` - Display each trace in its own trend.

   - `Multiple` - Display all traces on the same trend and on the same scale.

   - `Stacked` - Display all traces on the same trend, but each on its own scale.
   
1. Select the time picker and select the time range to view. To use a custom time range, select the **Custom Range** tab and specify the time range.

    ![Time picker](images/Time-picker.png)

1. Select **Step backward** or **Step forward** to move the time range of the data displayed in the trend.

   The trace will move in time increments displayed in the time range picker. For example, if the trend displays the last 8 hours, **Step backward** shows the previous 8-hour period. If it displays the last 30 days, **Step forward** shows the next 30-day period. Click the triangle to select another time range or specify a custom range.

   The legend table below the trend displays the Trace view. It shows the legend for each trace, the last value, minimum, maximum, and average values in the displayed time range.

1. Select a trace in the `Trend view` to select it for further analysis.

   The selected trace is highlighted, and two cursors automatically mark the minimum and maximum values for the displayed time range. These cursors, called *easy cursors*, remain as long as the trace is highlighted.

   ![Maximum and minimum cursors](images/Max_min_cursors.png)

1. Select the plus sign (**+**) above the trace to lock the cursors in place.
    
    The **+** turns into an **x**.  To unlock the cursor, select the **x**.

    **Note:** When two cursors are locked, the Legend table displays summary calculations for the values between the two cursors, known as the Cursor view.

    ![Cursor_view](images/Cursor_view.png)

1. Select the share icon ![share trend session icon](images/share-icon.png) in the menu bar to copy the URL of the workspace. 

    You can share this URL with colleagues to give them the same view of the trend, allowing you to collaborate about the data.
