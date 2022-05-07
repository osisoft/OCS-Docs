---
uid: CreateAssetTypeWithEditor
---

# Create an asset type

For more information on asset types, see [Asset types](xref:AssetTypes).

To create an asset type, follow these steps:

1. In the left pane, select **Visualization** > **Asset Explorer**.

1. From the **Asset/Asset Types** selector, select **Asset Types**.

1. In the toolbar, select **Add Asset Type**. 

1. In the right pane, complete the following fields:

   - **Asset Type** - Enter a name to identify the asset type.

   - **Description** - (Optional) Add a description for the asset type. 

1. Select the **Metadata** tab.

1. For each metadata to add to the asset type, select **Add Metadata** and complete the following fields:

   - **Metadata** - Enter an identifier for the metadata.

   - **Value** - Enter the value for the metadata.

      **Note:** The value must match the selected type. The following date/time format is supported: MM/DD/(YY)YY hh:mm(:ss)

   - **Type** - Select the value type from the dropdown list.

   - **UOM** - If the type is `Integer` or `Double`, select the unit of measure for the value.

1. Select the **Properties** tab. 

1. Select **Add Stream Type Reference**, select the stream in the `Select Stream Type` window, and then select **Add**.

   The stream type reference is listed in the **Properties** tab.

1. To configure statuses for the asset type, select the **Status** tab and select **Add Status Configuration**.

1. In the `Select Property` window, select the property that determines the asset status and select **Continue**.

    You can only specify one property to determine the asset status, and that property must have enumerated states or string values.

    **Tip:** You can switch to a different property by clicking the ![Change property icon](images/change-property-icon.png) icon.

1. For each value listed, select the status icon to map the value to a status. To add other values, select **Add Value Mapping**, enter the value, and select the corresponding status.

1. To save the asset, select **Save**. 
 
1. Click **Add Status Configuration**.

1. In the `Select Property` window, click the property that you want to display status for. Click **Continue**.

    **Note:** You can only specify one property with enumerated states as the the asset's status.

1. Click the status icons to map the status (Good, Warning, Bad) for each value.
    
    **Tip:** You can switch to a different property by clicking the ![Change property icon](images/change-property-icon.png) icon.
    
## Save the asset type

1. Click **Save**. 

## Related links 
- [Assets](xref:AssetsProperties) Properties
- [Asset Types API](xref:AssetTypesAPI)
