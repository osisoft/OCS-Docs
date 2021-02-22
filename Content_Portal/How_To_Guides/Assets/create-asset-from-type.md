---
Puid: CreateAssetFromAssetType
---

# Create an asset from an asset type

For more information on asset types, see [Asset types](xref:AssetTypes).

1. Click the menu icon ![menu icon](..\images\icon_navigation_bigger.png) and click **Asset Explorer**.

2. To change the [namespace](xref:AccountManagementConcepts#namespace), click on the namespace to open the Select a Namespace window.

    ![Namespace icon](../images/namespace-icon.png)

3. Select the namespace and click **Continue**.

4. Verify that the Assets/Asset Type selector is set to **Assets**.

2. Click the plus symbol (+) in the toolbar to open the Select Type for New Asset window. 

3. Select the type from the list and click **Continue**.
    The details blade opens on the right side.

3. Enter a name and description for the asset.
    Note: The asset type on which this asset is based is shown in the Asset Type field.

4. Click the **Metadata** tab. 

5. Edit the values for any of the metadata.
    Note: You can only edit the values. The metadata are derived from an asset type, as indicated by the T and, therefore, you cannot add or delete metadata or change the type.

    ![Metadata fields](..\images\edit-metadata-fields.png)

7. Click the **Properties** tab.

8. Click the caret symbol to open the stream reference configuration pane. 

    ![](..\images\type-stream-reference-caret.png)

9. Click **Choose a Stream** to open the Select Stream window.

    ![](..\images\choose-stream.png)

10. Select the stream from the list of streams.

     Note: Only streams of the type specified for the stream reference are displayed. In this example, only streams of type PI-Float32 are displayed.

     Search on the stream name, ID, or description. You can use the asterisk (*) as a wildcard.

11. Click **Add**.

12. Click **Configure UOMs**. 

15. On the Configure UOMs page, make any changes to the property UOMs.

    Note: UOMs can be set only on numeric types.

2. When you are done, click **Save**.

     Note: Once you click **Save**, any changes are immediately made to the UOMs on the stream, regardless of any other actions you take on this asset. For example, the UOM changes to the stream are not reversed if you click **Cancel** on the Properties tab or if you delete the asset.

3. Click **Save** to save the asset.
