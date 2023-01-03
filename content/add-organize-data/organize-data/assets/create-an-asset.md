---
uid: CreateConfigureAsset
---

# Add an asset

Follow this procedure to create an asset, add and configure its metadata and properties, and select and configure a property whose status will be visible in the card or table view.

To create an asset:

1. In the left pane, select **Visualization** > **Asset Explorer**.

1. From the **Asset/Asset Types** selector, select **Assets**.

1. In the toolbar, select **Add Asset**. 

1. In the `Select Type for New Asset` window, select **None** and select **Continue**.

1. In the right pane, complete the following fields:

   - **Asset** - Enter a name to identify the asset.

   - **Description** - (Optional) Add a description for the asset. 

1. Select the **Metadata** tab.

1. For each metadata to add to the asset, select **Add Metadata** and complete the following fields:

   - **Metadata** - Enter an identifier for the metadata.

   - **Value** - Enter the value for the metadata.

      **Note:** The value must match the selected type. The following date/time format is supported: MM/DD/(YY)YY hh:mm(:ss)

   - **Type** - Select the value type from the dropdown list.

   - **UOM** - If the type is `Integer` or `Double`, select the unit of measure for the value.

1. Select the **Properties** tab.

1. Select **Add Stream References**, select the stream in the `Select Streams` window, and then select **Add**.

   Selected streams and their properties are listed in the **Properties** tab.

   **Tip:** To search for streams based on the stream name, description, or the type, enter the text to search for in the **Enter search query** field. For more information on using this field, see <xref:search>.

1. If needed, modify the stream names to make them easier to identify.

1. To update the property units of measure for a stream, select **Configure UOMs** for the stream. 

    **Note:** Units of measure can be set only on numeric types.

1. On the `Configure UOMs` page, update the property units of measure as needed and select **Save**.

    **Note:** When you select **Save**, any changes are immediately saved to the UOMs on the stream, regardless of any other actions you take on this asset. For example, the UOM changes to the stream are still saved even if you do not save the new asset.

1. To configure statuses for the asset, select the **Status** tab and select **Add Status Configuration**.

1. In the `Select Property` window, select the property that determines the asset status and select **Continue**.

    You can only specify one property to determine the asset status, and that property must have enumerated states or string values.

    **Tip:** You can switch to a different property by clicking the ![Change property icon](../../../_icons/branded/swap-horizontal.svg) icon.

1. For each value listed, select the status icon to map the value to a status. To add other values, select **Add Value Mapping**, enter the value, and select the corresponding status.

1. To save the asset type, select **Save**.
