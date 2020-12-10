---
uid: CreateAssetType
---

# Create an asset type with the asset types editor

For more information on asset types, see [Asset types](xref:AssetTypes).

1. Click the menu icon ![menu icon](..\images\icon_navigation_bigger.png) and click **Asset Explorer**.

2. To change the [namespace](xref:AccountManagementConcepts#namespace), click on the namespace to open the Select a Namespace window.
    ![Namespace icon](..\images\namespace-icon.png)
    
3. Select the namespace and click **Continue**.

4. Click the Asset/Asset Type selector and click **Assets Types** from the list.

    ![Asset Type selector](..\images\asset-type-picker.png)

5. Click the plus symbol (+) in the toolbar.

    The details blade opens on the right side.

6. Enter an ID and description for the asset type.

### Add metadata to the asset type

1. Click the **Metadata** tab to add asset metadata.

   Note: Metadata is static attributes about assets, for example, model or region.

   <!-- We need a definition for metadata that covers its use in different OCS contexts. --> 

2. Click **Add Metadata**.

    The fields for entering the metadata details appear. 

    ![Metadata fields](..\images\metadata-fields.png)

4. Enter a name for the metadata.

5. (Optional) Enter a value for the metadata and select a type. 
   Note: The value must match the selected type. The following date/time format is supported: MM/DD/(YY)YY hh:mm(:ss).

   <!--WRITER NOTE: What date/time formats are supported? Is this the same as for PI Server? i.e., Microsoft standard date/time formats? -->

6. (Optional) Select a UOM.

7. Continue adding metadata for the asset. 

### Add measurements to the asset type

1. Click the **Measurements** tab. 

2. Click **Add Stream Type Reference**.

3. In the Select Type for Measurements window, click the stream type you want.

4. Click **Add**.
   The stream type reference appears in the asset type definition in the right pane. 
   ![Stream type reference](..\images\stream-type-reference.png)

5. Click the caret symbol to display the measurements for the stream reference.
    ![Stream type reference](..\images\stream-type-reference-caret.png)
    The measurements associated with the stream are displayed.
    ![Stream type reference](..\images\stream-type-reference-measurement.png)

6. Edit the names of the measurements.

   Tip: By default, the stream reference is appended as a prefix for all measurement names. You can change this prefix and it will automatically get appended to all measurement names. This is useful if you have multiple streams with the same properties. The prefix is an easy way to distinguish between the different streams.

7. Clear the **Include** checkbox to remove any measurements you don't want to include.

8. Click **Preview** to see a simple list of all measurements from all streams associated with this asset.

### Add status tracking to the asset

1. Click the **Status** tab.
2. Click **Add Status Configuration**.
3. In the Select Measurement window, click the measurement that you want to display status for. Click **Continue**.

    Note: You can only specify one measurement with enumerated states as the the asset's status.

1. Click the status icons to map the icon for each value.
    ![Mapping status icons](..\images\map-status-values.png)
    
    All the values have been mapped in the following screen capture.
    ![Mapped status](..\images\mapped-status-values.png)
    
    Tip: You can switch to a different measurement by clicking the ![Change measurement icon](..\images\change-measurement-icon@50.png) icon.
    
### Save the asset type

1. Click **Save**. 