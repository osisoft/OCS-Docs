---
uid: GetStartedROM
---

# Get started with remote operations monitoring

OSIsoft Cloud Services (OCS) makes it possible to monitor remote assets in real time. The immediate access to data about the status of assets gives you the ability to anticipate problems and proactively perform preventative maintenance.

For example, a fleet manager of a mining truck dealer sells trucks to companies worldwide. The company provides monitoring and maintenance services to its customers. With remote monitoring, they review the status of the trucks each day, identify trucks with problems, use the data collected on different measurements to identify possible causes, review the history of these measurements over time, and share the information with colleagues in the field who can follow up on the problem.

The following procedure describes how to use the portal to monitor assets and quickly identify problems. The screen captures are taken from the scenario described in the example above.

To use the portal to monitor assets and identify problems, follow these steps:

1. From the left pane, select **Visualization** > **Asset Explorer**. 
   
    The asset explorer displays the available assets. In this example, it provides an overview of the health of the fleet of trucks.

    **Tip:** Select the ![View grid](../_icons/branded/view-grid.svg) or ![View list](../_icons/branded/view-list.svg) icons in the toolbar to toggle between the card and table views of the assets.

1. Verify that the **Assets/Asset Type** selector is set to **Assets**.

1. To identify any assets with a problematic status, select the Metadata filters icon ![Filter](../_icons/branded/filter.svg), and then select the checkbox for the status to review.

    Each asset is identified with one of the following statuses:

    | Icon   | Status  |
    | ------ | ------- |
    | ![Okay icon](../_icons/custom/check-circle.svg) | Good    |
    | ![Warning icon](../_icons/custom/alert.svg) | Warning |
    | ![Alarm icon](../_icons/custom/close-octagon.svg)    | Bad |
    | ![Unknown icon](../_icons/branded/help-box.svg)    | Unknown |

1. Select an asset to open the `Asset Details` pane.

   The `Asset Details` pane provides metadata and property data on the asset that you can use to determine the cause of any problems. The **Metadata** tab displays metadata associated with the asset.

1. Select the **Properties** tab.

    The `Asset Details` pane displays the following:
    
     - Data associated with the asset. These values are updated in real time.
    
     - A trend of the selected measurements.

1. Select one or more of the properties that might be the cause for the warning.

1. Review the history of the selected properties in the trend to see if the data suggests you have identified a potential cause. 

    By default, the trend shows the property data for the last 8-hour period. Use the navigational arrows on the Time picker ![Time picker](images/Time-picker.png) to pick another time-range option or specify a custom time range.

1. To see the details of these properties, select the **View full trend** icon ![View full trend icon](../_icons/branded/launch.svg) to see the `Trend` page.

    The `Trend` page shows the properties for the same time range shown in the `Details` pane of the Asset Editor.
    <!--AF 11/19/21 From this point on, the topic repeats the Get started with trend data topic. I think it would be better to link to that topic for instructions, so we don't have to maintain the information twice. -->

1. (Optional) Select the ![Trend views icon](images/trend-views-icon.png) icon to change the view.

    **Note:** The legend table shows the legend for each trace, the last value, minimum, maximum, and average values in the displayed time range.

    ![Legend Table](images/Legend_Table_Med.png)
    
1. (Optional) If the error did not occur in the time range currently in view, select **Step backward** ![Step backward](../_icons/branded/skip-backward.svg) or **Step forward** ![Step forward](../_icons/branded/skip-forward.svg) to move the time range backward or forward.

    **Note:** The trace will move in increments of time that are displayed in the trend. If the trend displays the last 12 hours, use the step backward arrow in the Time picker to show the previous 12-hour period. If it displays the last 30 days, the step forward arrow shows the next 30-day period.

1. Select a trace to select it for further analysis.

    The trace is highlighted, and two cursors automatically mark the minimum and maximum values for the displayed time range.

    ![Maximum and minimum cursors](images/Max_min_cursors.png)

    Select **+** above the trace to lock the cursor in place. The **+** turns into an **x**. Select the **x** to unlock the cursor.

1. To add other cursors at data points of interest, select **+** above the trace to lock the cursor in place.

    **Note:** When two cursors are locked, the legend table displays summary calculations for the values between the two cursors.

1. Select the **Share Trending Session** icon ![Share](../_icons/default/share.svg) in the menu bar to copy the URL of the workspace.

    Share this link to give others the same view of the trend that they can then use to troubleshoot problems.
