---
uid: gsAssetTypes
---

# Get started with asset types

An asset type is a template for creating assets that share a common structure or type. For more information about asset types, see [Asset types](xref:AssetTypes).

You can create an asset type in one of the following ways:

- [Create an asset type from the beginning](#create-an-asset-type-with-the-asset-explorer) 

- [Convert an existing asset to an asset type](#create-an-asset-type-from-an-asset)

## Create an asset type with the asset explorer

To use the asset explorer to create an asset type, follow these steps:

1. In the left pane, select **Visualization** > **Asset Explorer**.

1. From the **Asset/Asset Types** selector, select **Asset Types**.

1. In the toolbar, select **Add Asset Type**.

1. In the right pane, complete the following fields:

   - **Asset Type** - Enter *MyData.PumpType*.

   - **Description** - (Optional) Add a description for the asset type. By default, this description is inherited by assets created with this asset type, but it can be overwritten on the individual assets.
   
1. Select the **Metadata** tab, and then select **Add Metadata**.

1. Complete the following fields:

   - **Metadata** - Enter *Maximum Flow Rate*.

   - **Value** - Enter *2*.

   - **Type** - Select *Double*.

   - **UOM** - Select *US gallon per minute (Volume Flow rate)*.
   
1. Select the **Properties** tab, and select **Add Stream Type Reference**.

1. In the `Select Stream Type` window, select **MyData.PumpState** in the list, and then select **Add**.

1. Select the **Status** tab, and select **Add Status Configuration**.

    The `Select Property` window opens with a list of properties that can be represented as a status. For a property to be configured as a status, the property must be an enumerated state. To exit the window, select **Cancel**.
    
1. To save the asset type, select **Save**. 
    
1. In the `Asset Type` pane, use the icons in the upper right of the toolbar to switch between the following:

     -  ![Card view](images/card-view.png) - Card view displays the asset types as a series of tiles.

     -  ![Table view](images/table-view.png) - Table view displays the asset types in a table format.

## Create an asset type from an asset

To create an asset type based on an existing asset, follow these steps:

1. In the left pane, select **Visualization** > **Asset Explorer**.

1. From the **Asset/Asset Types** selector, select **Assets**.

1. Select the **MyData.Asset** asset.

   **Note:** In the upper-right corner of the right pane, **Asset Type** is set to *<None>* indicating that this asset is not based on an asset type. 

1. Select the **More Options** icon ![More Options](../../_icons/default/dots-vertical.svg), then select **Save as Asset Type**.

1. In the `Create an Asset Type for MyData.Asset` window, complete the following fields:
   
   - `Name` - Enter **MyData.TankType**.

   - `Description` - (Optional) Add a description for the asset type. By default, this description is inherited by assets created with this asset type, but it can be overwritten on the individual assets.

1. Select **Create**. 

   The MyData.TankType asset type is added to the asset type list and the **Asset Type** for the MyData.Asset asset is now set to `MyData.TankType`. 

## Next step

Continue with [Get started with metadata rules](xref:gsMetadataRules).
