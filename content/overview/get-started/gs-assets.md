---
uid: gsAssets
---

# Get started with assets

An asset is a container that includes metadata and references to streams related to a logical asset. For more information about assets, see [Assets](xref:ccAssets).

To create an asset:

1. In the left pane, select **Visualization** > **Asset Explorer**.

1. From the **Asset/Asset Types** selector, select **Assets**.

1. In the toolbar, select **Add Asset**. 

1. In the `Select Type for New Asset` window, select **None** and select **Continue**.

1. In the right pane, complete the following fields:

   - **Asset** - Enter *MyData.Tank*.

   - **Description** - (Optional) Add a description for the asset. 
   
1. Select the **Metadata** tab, and select **Add Metadata**.

1. Complete the following fields:

   - **Metadata** - Enter *Capacity*.

   - **Value** - Enter *200*.

   - **Type** - Select *Double*.

   - **UOM** - Select *US gallon (Volume)*.

1. Select the **Properties** tab, and select **Add Stream References**.

1. In the `Select Streams` window, enter *MyData*_*_ in the search field and press Enter.

1. Select **MyData.NorthAmerica.SLTC.PumpA** from the list and select **Add**.

1. In the **Stream References** field, enter *Output Pump State* as the user-friendly name for the stream reference.

1. Assign a unit of measure (UoM) to the stream properties, select **Configure UOMs**.  

   **Note:** The UOM set here overrides any UOM assigned to property. No data conversion occurs between the two UOMs.
   
1. Select the **Status** tab, and select **Add Status Configuration**.

   The `Select Property` window lists the properties whose values can be displayed as a status. Only properties with an enumerated state or that have a string value can be displayed.
   
1. Select the **Output Pump Status | Status** property, and then select **Continue**. 

   If there are no values in the stream, there will be no eligible values to choose from. If there are eligible values that can be mapped to different statuses, 
   
1. For each value listed, select the associated status, **Good**, **Warning**, or **Bad**.  

1. To save the asset, select **Save**. 

1. In the `Assets` pane, use the icons in the upper-right to switch between the following views:

   - ![Card view](../../_icons/branded/view-grid.svg) - Card view displays the assets as a series of tiles.
    
   - ![Table view](../../_icons/branded/view-list.svg) - Table view displays the assets in a table format. 

## Next step

Continue with [Get started with asset types](xref:gsAssetTypes).
