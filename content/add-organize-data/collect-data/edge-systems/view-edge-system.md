---
uid: ViewEdgeSystem
---

# View an edge system

View the edge systems, including Edge Data Store and PI Adapters, for a selected namespace to review current status and configuration information. You can filter and sort the list of edge devices, and open a trend displaying diagnostic data for a specific device or component.

Use the following procedure to view an edge system:

1. From the left pane, select **Data Collection** > **Edge Systems**.

1. **Optional:** Click on a column header to sort by that column in descending order. Click again to sort in ascending order.

1. **Optional:** Click on the filter icon in a column header to filter the edge systems shown based on that column.

  **Note:** You can filter for multiple tags using `and` and `or` syntax to refine the filter.

1. Click on a device to see open the right pane that displays information for that device. 

1. Click on the `Details` tab to see the edge system installed on the device and the configured components.

1. Click on the `Configuration` tab to review the configuration details.

1. Click the **View Trend** ![View Trend with Diagnostic Data](/images/view-trend-icon.png "View Trend with Diagnostic Data") to open a trend showing diagnostic data in a new window.

  The level where you click the icon determines what data is included. Click the icon at the top level to see all available diagnostic data for the device. Click the icon at the edge system level to see the diagnostic data available for that edge system. Click the icon at the component level to see the diagnostic data available for that component. 

## Remove an edge system

You can remove edge systems from the list of edge systems in OCS, but the system is not uninstalled. After an edge system is removed, you can no longer see or manage it from OCS. Use the following procedure to remove an edge system:

1. In the left pane, select **Data Management** > **Edge Systems**.

1. Find and click on the edge device to remove.

1. Click **More Options** and select **Remove Edge System**.

1. Click **Remove** to confirm removing the selected edge system from the list.
