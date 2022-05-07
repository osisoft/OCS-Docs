---
uid: transfer-data
---

# Transfer data to OCS
<!-- AF 11/15/21 This topic appears in the TOC twice. It could also use to be broken into Define a data transfer and Start a data transfer. -->
<!-- VT 11/29/21: This has been addressed by PR #764 (edits to PI to OCS landing pages).-->
You initiate a data transfer from the `PI to OCS Agents` window. A transfer can consist of PI points and AF elements or AF elements that reference at least one PI point.

PI points can be added to a transfer explicitly using a tag search or implicitly using AF element references. For information, about the difference between implicit and explicit references, see [Explicit versus implicit PI points](#overview-of-explicit-vs.-implicit-pi-points).

**Before you begin:** Download and install the PI to OCS Agent. Register your PI Data Archive and AF data sources using the PI to OCS Agent Configuration Utility. 

## Create a transfer

Transfer creation consists of the following tasks:

1. Assign a name, description, and optional historical start and end time for data retrieval.

1. Select a level of data privacy to control how much identifying information about an asset is sent with PI point data.

1. Set query criteria and retrieve and add optional AF elements, which reference at least one implicit or explicit PI point, and/or PI point data to the transfer lists.

1. View transfer details.

1. Save the transfer.

1. (Optional) Export a file(s) that contains transfer detail information.

1. Initiate the data transfer and monitor its progress. 

**Note:** If you have configured an AF server, you will not be able to create a transfer until AF indexing is complete. AF indexing status is listed on the `Details` pane in the `PI to OCS Agents` page. The following image shows AF indexing in progress:

![](../../images/af-indexing.png)

## Name the transfer and set data privacy settings 

To name the data transfer, follow these steps: 

1. In the left pane, select **Data Collection** > **PI to OCS Agents**.

1. In the `PI to OCS Agents` window, select the agent for the data transfer.

1. In the `Details` pane, select **Create Transfer**.

   The `Transfer Setting` window opens.

   ![](../../images/transfer-settings.png)
   
1. In the **Name** and **Description** fields, enter a name and description for the transfer.

1. (Optional) In the **Historical Start time** fields, enter a historical time context for the data retrieval.

   **Note:** OCS supports out of order events and stores data in chronological order by timestamp. PI Data Archive 2017 SP2 or higher is required for this feature. Be sure to enter the historical start date and time correctly to ensure all data is included in the transfer. No data before the historical start time will be captured and stored in SDS. See [Overview of data transfers](https://docs.osisoft.com/bundle/ocs/page/add-organize-data/collect-data/connectors/pi-to-ocs/pi-to-ocs-data-transfers/overview-data-transfers.html) to learn more about transferring historical data.

1. To set the data privacy level for the transfer, select one of the following **Stream Metadata Replication Policy** settings: 

   * **High** - Sends all intended metadata.
   * **Medium** - Default. Send metadata without logical addresses from the data source.
   * **Low** - Sends no metadata from the data source namespace. Locally configured metadata such as point source and local aliases is allowed (point name, point ID and point source only).
   * **None** - Only the point ID and point name is sent; no metadata is included in the transfer.

   **What PI point attributes are transferred with each Stream Metadata Replication Policy (data privacy) setting?**

    |   | High | Medium | Low | None |
    | ------------- | ----------------- | ----------------- |----------------- | ----------------- |
    | Name | X | X  | X | X | X |
    | Descriptor | X | X |  
    | EngUnits | X | X |  |  |  |
    | ExDesc | X |  |  |  |
    | InstrumentTag | X  |  |  |  |
    | PointId | X | X | X | X |
    | Pointsource | X | X | X |  |
    | PointType | X | X |  |  |
    | SourceTag | X | X |  |  |
    |Step | X | X |  |  |

1. Select **Ok**.

   The transfer is created and the `Transfer` page opens.

**Note:** To modify the transfer settings, select **Settings** to access the `Transfer Setting` window and modify the name, description, historical start and end times, and data privacy settings as needed.

## Build an AF elements transfer list

After naming the transfer, build an AF elements transfer list by setting query criteria and then selecting AF elements. You can narrow your search by filtering by element name, asset group, attribute name/value, template, and category.

To build an AF element

1. On the `Transfer` page, select the **AF Database** down arrow, then select the source AF database to search.

   ![](../../images/transfer-win.png)

1. (Optional) Select **Root Asset**.

1. (Optional) In the `Select Root Element` window, select the plus buttons to drill down to the root asset in the AF database hierarchy, select a root asset, then choose **Select**. <!-- AF 11/15/21 UGH! I hate "select **Select**". Makes me want to use click. -->

1. (Optional) In the **Element Name** field, enter search criteria to filter by part or all of an AF element name.

   **Note:** If you do not enter filter criteria, the search defaults to `*` or all.  

1. (Optional) In the **Attribute Name** field, enter the attribute name.

1. (Optional) In the **Attribute Value** fields, filter attribute values by specifying the following information:

      * In the first field, enter an attribute name.

      * In the second field, use the dropdown list to select an operator (`=`, `<>`, `<`, `>`, `=<`, `=>`, `In`).

      * In the last field, enter an attribute value.

   **Note:** Custom unit of measurements (UOMs) are not supported. During the transfer of AF element data, AF elements with custom UOMs will not have their corresponding asset's UOM property set.

1. (Optional) To narrow your search by template name, in the **Template** field, select a template from the dropdown list.

1. (Optional) To narrow the search by a specific AF category, in the **Category** field, select a category from the dropdown list.

1. To execute the query and retrieve results, select **Search**.

1. In the `Search Results` list, select each AF element you want added to the transfer.

   A check mark appears next to each selected AF element.

   **Tip:** To select a range of elements, select an element and then hold Shift and select a non-adjacent element. To advance through multiple-paged query results, select the back and forward arrows or enter a page number in the **Page** field.

1. When you are done selecting elements, select **Add AF Elements To Transfer**.
    
   The elements are added to the transfer and listed on the **AF Elements** tab.

1. To add additional elements from other AF databases, repeat these steps. 

1. To add the selected AF elements to the transfer, select **Save**.

**Note:** AF indexing needs to complete before you can view implicit PI points and start the transfer process.

## View AF element details

You can view details about an individual AF element such as related attribute names, values, and data references.

To view AF element details, follow these steps:

1. Select an AF element on the **AF Elements** tab.

1. Select **View Details**.

   The `AF Element Information` pane opens and displays details about AF element attributes. 
   
1. To view the paths of referenced AF elements, select the **Reference AF Elements** tab.

1. To view details for another AF element, deselect the currently selected element, and then select a different element in the transfer list.

1. To close the `AF Element Information` pane, select **View Details**.

## Build a PI points transfer list

You build a PI points transfer list by setting query criteria and then adding the desired PI points. A PI points transfer list may contain both implicit and explicit PI points. See [Overview of explicit vs. implicit PI points](#overview-of-explicit-vs.-implicit-pi-points) for more information.

To build a PI points transfer list, follow these steps:

1. Select the **PI Point Search** tab.

1. To open the `Search` pane, select **Add**.

1. To filter the results, do the following:

   | Criteria To Filter By      | Action To Take                                               |
   | -------------------------- | ------------------------------------------------------------ |
   | Common PI point attributes | Enter criteria in any of the following fields:<br /><ul><li>**Name** (alias for tag attribute)</li><li>**Point Source**</li></ul><br /><br />**Note:** Enter * to retrieve all PI points. |
   | Point descriptions         | Enter criteria in the following fields:<br /><ul><li>**Descriptor** </li><li>**Extended Descriptor**</li></ul> |
   | Engineering units          | Enter criteria in the **Engineering Units** field.           |
   | PI point type            | Select one of the following point types from the **Point Type** dropdown list:<br /><ul><li>`Float32`</li><li>`Float64`</li><li>`Int16`</li><li>`Int32`</li><li>`Digital`</li><li>`Timestamp`</li><li>`String`</li></ul> |
   | Specific location code(s)  | Enter up to five location code values (1-9) in the **Location Codes** field. |

1. (Optional) To collapse or expand the criteria section, select the **Search Criteria** bar.

1. To execute the query and retrieve matching results, select **Search**.

1. In the **Search Results** area, select each PI point to add to the data transfer.

   A check mark appears next to each selected PI point.

   **Tip:** To select a range of PI points, select a PI point and then hold Shift and select a non-adjacent PI point. To advance through multiple-paged query results, select the back and forward arrows or enter a page number in the **Page** field.

1. When you are done selecting PI points, select **Add PI Points to Transfer**.

   The points are added to the transfer and listed on the **PI Points** tab.

## Explicit versus implicit PI points

PI points added to a transfer are assigned one of the following reference types:

  * Explicit - PI points directly retrieved from a PI Data Archive.

  * Implicit - PI points referenced by AF element attributes that have been retrieved by searching an AF server.

The reference type indicates the PI point's source and how it was retrieved. The reference type for each PI point is listed in the `Reference Type` column on the **PI Points** tab. 

## View PI point details and hide implicit PI points

You can view attribute details for selected PI points in a transfer. Implicit PI points are PI points referenced by AF elements in a transfer. You can hide implicit PI points to temporarily remove them from view on the **PI Points** tab. Hidden implicit PI points are still included in a transfer unless the referencing AF elements are removed from the transfer list. 

To view PI point details, follow these steps:

1. In the `Transfer` pane, select the **PI Points** tab.

1. Select a PI point and select **View Details**.

   The `PI Point Information` pane opens.

1. To view the path of any AF elements that reference the PI point, select the **Source AF Elements** tab. 

1. (Optional) To hide implicit PI points on the PI points list, turn off the **Show Implicit PI Points** toggle.

   **Note:** Implicit PI points are referenced by AF element attributes and retrieved from an AF server. Hiding implicit PI points does not remove them from a transfer.  

1. (Optional) To show hidden implicit PI points, turn on the **Show Implicit PI Points** toggle.

1. To view another PI point's details, select to select a different PI point in the transfer list.

1. To close the `PI Point Information` pane, select **View Details** or **x**.

## Save a transfer

Before you can transfer data to OCS, you must save the transfer. To make changes to a transfer, you have to remove the existing transfer and define a new transfer.<!--AF 11/15/21 - I don't like that there is just a single a step for saving the definition. -->
<!--VT, 11/29/21: Ok.-->

To save the data transfer definition, follow these steps:

1. To ensure that the data transfer definition is correct, review the definition.

1. In the `Transfer` pane, select **Save**.

## Overview of the Details pane
<!--AF 11/15/21 - This section doesn't belong in this topic about how to define a transfer.-->
<!-- VT, 11/29/21: I can move this into it's own topic; SMEs and myself wanted to explain what these fields represented.-->
The `Details` pane provides information about the agent associated with the transfer, the transfer progress, the data sources, and details about the PI points and AF elements transferred. The following image show the sections in the `Details` pane, which you can expand and collapse using the arrows ( ![Down](../../../../../_icons/default/chevron-down.svg) ![Up](../../../../../_icons/default/chevron-up.svg) ):  

![](../../images/details-pane1.png)
![](../../images/details-pane2.png) 

Each section of the `Details` pane is described in the following table.

| Numbered section | Description                                                  |
| ---------------- | ------------------------------------------------------------ |
| **1**            | `Agent Overview` - Lists the agent description (if any), namespace, status, version, and date and time of last connection. |
| **2**            | `Transfer Overview` - Displays transfer details and progress. Also contains buttons to view, remove, or stop a transfer. |
| **3a**            | Under the registered Data Archive ( ![](../../../../../_icons/branded/osisoft.svg), the Streaming and Historical Events Per Second fields list the number of events successfully transferred to OCS. Historical events represent the number of incoming events per second that come from a backlog of events for the PI points associated with the transfer, which are not transferred as "real-time" events. Streaming events represent the number of current, real-time events transferred into OCS. |
|**3b**            |If an AF server has been added, details about the AF server and transferred elements are shown under the listed  AF server data source ( ![](../../../../../_icons/branded/cube-outline.svg) ). The AF status fields provide information about the number of AF elements and assets succesfully transferred and created: <ul><li>**Total Elements in Transfer**: The total number of AF elements in transfer. </li><li>**Total Elements Transferred**: The number of elements transferred to OCS.</li><li>**Total Assets Created**: The number of assets created in OCS.</li><li>**Assets Updated**: The number of assets updated during the transfer process.</li><li>**Asset Create/Update Errors:** The number of errors generated while creating or updating assets.</li> |

## Transfer data to OCS

Data is ready for transfer after the desired PI points and/or AF elements have been added. During the transfer, events are sent asynchronously. Historical events are sent first, followed by current events. 

**Note:** Modifications to an AF database or Data Archive digital state table during a PI to OCS transfer require that you manually stop and restart the transfer to capture all changes. Follow these steps to ensure all data is captured:

  1. Stop the transfer.

  2. Make modifications to the AF database and/or Data Archive digital state tables.

  3. Restart the transfer to pick up these changes.

## Start a data transfer

To start a data transfer, follow these steps:

1. (Optional) In the `PI to OCS Agents` window, select the PI to OCS Agent associated with the data transfer. 

1. (Optional) In the `Details` pane, expand the `Transfer Overview` section.

1. Select **Start Transfer**, then select **Start**.

   The transfer of data begins and the transfer status is shown in the `Transfer Overview` section.

1. In the `Details` pane, expand the `Data Source` section to view the status of a transfer as data is sent.

   **Note:** The rate at which data transfers varies and depends on the density of data in the source PI Data Archive and/or AF server. See [Data transfer statuses](xref:data-transfer-statuses) for a list of transfer statuses and descriptions. To find out more information about an asset error, agent status, or asset create/update error, select the **Logs** button above the list of agents to access more information. Possible statuses that appear in the **Current Activity** field may indicate an issue include Uncategorized Error, PI Point Type Change Detected, and No Valid PI Points In Transfer.   

1. (Optional) If the fields in the `Details` pane indicate there are issues with the transfer or agent, select **Logs** to open the `Logs` window and view more information.
    
1. (Optional) To stop a transfer, select **Stop Transfer**, then select **Stop**.

1. (Optional) To remove a transfer, select **Remove Transfer**, then select **Remove**.
