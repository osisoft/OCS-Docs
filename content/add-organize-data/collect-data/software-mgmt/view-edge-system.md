---
uid: ViewEdgeSystem
---

# View and monitor an edge system

View and monitor the health status and configuration information for edge systems, including Edge Data Store and PI Adapters, for a selected namespace. You can filter and sort the list of edge devices, and open a trend displaying diagnostic data for a specific device or component. 

**Note:** An edge system appears on the `Software Management Edge Systems` page once it is writing health data to OCS. For information on configuring health endpoints, see the specific edge system product documentation.

## View an edge system

To view an edge system:

1. From the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Edge Systems**.

1. **Optional:** To sort by a column in descending order, select the column header. To sort in ascending order, select the header again.

1. **Optional:** To filter the edge systems shown based on a specific column, select the filter icon in the column header. 

  **Note:** Filter for multiple tags using `and` and `or` syntax to refine the filter.

1. To open the right pane that displays information for a device, select the device. 

1. To see the edge system installed on the device and the configured components, select the `Details` tab.

1. To review the configuration details, select the `Configuration` tab.

1. To open a trend showing diagnostic data in a new window, select the **View Trend** ![View Trend](../../../_icons/default/chart-line-variant.svg) icon.

  The level where you select the icon determines what data is included:

   - To see all available diagnostic data for the device, select the icon at the top level. 

   - To see the diagnostic data available for a specific edge system, select the icon at the edge system level. 

   - To see the diagnostic data available for a specific component, select the icon at the component level. 

## Remove an edge system

You can remove edge systems from the list of edge systems in OCS, but the edge system remains on the device. After an edge system is removed from OCS and it is no longer sending data to OCS, you can no longer see or manage it from OCS. If an edge system sends health data to OCS after it has been removed from the list of edge systems, it will reappear in the list of edge systems.

To remove an edge system:

1. In the left pane, select **Data Collection** > **Software Management**.

1. Verify that the **Edge Systems/Base Configurations** selector is set to **Edge Systems**.

1. Find and select the edge device to remove.

1. Select **More Options** and select **Remove Edge System**.

1. To confirm removing the selected edge system from the list, select **Remove**. 
