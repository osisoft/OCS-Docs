---
uid: CreateAssetTypeWithEditor
---

# Create an asset type

For more information on asset types, see [Asset types](xref:AssetTypes).

## Procedure

1. In the left pane, select **Visualization** > **Asset Explorer**.

2. Optional: Click the **Change Namespace** button in the upper-right toolbar, then select the desired namespace.

4. Click the **Assets/Asset Type** selector and click **Assets Types** from the list.

5. Click the **+** in the toolbar.

    The details blade opens on the right side.

6. Enter an Id and description for the asset type.

## Add metadata to the asset type

1. Click the **Metadata** tab to add asset metadata.

   **Note:** Metadata is static attributes about assets, for example, model or region.

   <!-- We need a definition for metadata that covers its use in different OCS contexts. --> 

2. Click **Add Metadata**.

   **Result:** The fields for entering the metadata details appear. 

4. Enter a name for the metadata.

5. Optional: Enter a value for the metadata and select a type.
  
   **Note:** The value must match the selected type. The following date/time format is supported: MM/DD/(YY)YY hh:mm(:ss).

   <!--WRITER NOTE: What date/time formats are supported? Is this the same as for PI Server? i.e., Microsoft standard date/time formats? -->

6. Optional: Select a UOM.

7. Continue adding metadata for the asset. 

## Add properties to the asset type

1. Click the **Properties** tab. 

2. Click **Add Stream Type Reference**.

3. In the `Select Stream Type` window, click the stream type you want.

4. Click **Add**.
   
   **Result:** The stream type reference appears in the asset type definition in the right pane.

5. Click the scroll bar to display the properties for the stream type reference.
    
   **Result:** The properties associated with the stream type are displayed.
    
## Add status tracking to the asset

1. Click the **Status** tab.
 
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
