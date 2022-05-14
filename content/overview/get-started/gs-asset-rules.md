---
uid: gsAssetRules
---

# Get started with asset rules

Use asset rules to automatically create assets based on streams you find by specifying a stream naming pattern. Asset rules work best if your stream names adhere to a consistent naming convention. For example, the following streams are similarly named, and each contains a timestamped series of measurements for similar pumps:

- **MyData.NorthAmerica.SLTC.PumpA.Temperature**
 
- **MyData.NorthAmerica.SLTC.PumpA.Pressure**
 
- **MyData.NorthAmerica.SLTC.PumpA.CurrentStatus**
 
- **MyData.NorthAmerica.SLTC.PumpB.Temperature**
 
- **MyData.NorthAmerica.SLTC.PumpB.Pressure**
 
- **...**
 
- **MyData.NorthAmerica.SLTC.PumpT.CurrentStatus**

An asset rule enables you to use these stream names to automatically create pump assets with properties such as temperature, pressure, and current status, along with metadata about their location.

Because the following procedure uses the stream **MyData.NorthAmerica.SLTC.PumpA** that you created in  [Get started with streams](xref:gsStreams), it demonstrates use of an asset rule with a more complex stream that has multiple properties. However, the same principles apply.

To create a new asset rule, follow the steps in the these procedures.

1. [Create a new asset rule](#create-a-new-asset-rule): Create a new asset rule.

2. [Extract tokens](#extract-tokens): Assemble token values so you can select the information you want from your streams. 

3. [Map tokens](#map-tokens-to-values): Map the tokens to values.

4. [Configure assets](#configure-assets): Assign tokens values to asset fields.

5. [Preview assets](#preview-assets): Display a preview of the assets that will be created by this rule. 

For more information about asset rules, see [Asset rules](xref:AssetRules).

## Create a new asset rule 

Create a new asset rule.

1. In the left pane, select  **Data Management** > **Asset Rules**.

1. From the **Namespace** dropdown list, ensure the correct namespace is selected.

1. In the toolbar, select **Add a Rule**.

1. In the **Create New Asset Rule** window, enter the following information.

   - `Name` &ndash; **MyData.AssetRule**
   
   - `Description` &ndash; Optionally, add a description for this asset rule.
   
   - `Asset Type` &ndash; Select the **MyData.PumpType** asset type from the dropdown list.

1. Select **Continue** to proceed to the **Select Stream** window.

1. In the **Enter search query** field, enter the query string **MyData._*_** and select **Search**. 

   The window should display the **MyData.NorthAmerica.SLTC.PumpA** and **MyData.NorthAmerica.SLTC.PumpB** streams. 

1. Select the **MyData.NorthAmerica.SLTC.PumpA** stream and select **Add**.

## Extract tokens

Assemble token values so that you can select the information you want to extract from your streams. 

1. Initially, **MyData** should be highlighted. Use the slider to select the `.` character, so that **MyData.** is highlighted.

1. For the **1. Match:** option, select **the string literal "MyData."**. The asset rule will find only streams begin with this string. 

   **Note**:  In this case, the token value is not named and is not used in the asset configuration. 
   
1. Select **Capture** to move to the next character group. The first matching rule is listed and the next group, **NorthAmerica**, is highlighted. 

1. For the **2. Match:** option, select **letters preceding the delimiter "."**. This allows you to use this as a token in the asset configuration. 

1. In the **and name it:** field, enter **Region**, and select **Capture**. This adds two rules, one for the Region and another for the "." delimiter. 

1. Next, **SLTC** is selected. In this case, we know our naming pattern enforces a 4-letter abbreviation for the site, so in **3. Match:** select **the next 4 letters**. This helps ensure we do not match any streams that we do not expect. 

1. Name this token **Site** and select **Capture**.

1. Now, **PumpA** is selected. Because we want to distinguish pump streams from other streams, use the slider to select only **Pump**, and select **the next 4 characters of any type**. 

1. Name this token **Equipment** and select **Capture**.

1. Finally, just **A** is selected. Use the option **letters until the end of stream name**, and name this token **Id**. 

1. Select **Capture**.

   **Note**: Alternatively, you can bring in tokens by using the **Stream Metadata** button. 

1. In the left panel, select **Stream Metadata**. You see the two metadata tokens added to the stream by the metadata rule you just created, **Region** and **Site**. This can be a useful way to bring in more tokens for some streams. 

1. Leave the **Region** and **Site** tokens unchecked.

1. Select **Back to Stream Name Pattern**.

1. Select **Next**.

## Map tokens to values 

Map tokens to specific values. 

1. Configure a name for the stream reference. Select the button and select the **{Equipment}** token.

1. Map each token to a value. Select **{Region} - NorthAmerica** and select **Use Existing Token Values** to take the values from the stream name and use them without alteration.

1. Select **{Site} - SLTC** and select **Rename Token Values**. 

1. Select **Generate Mappings**. This adds a row for mapping the value **SLTC** that was present in the selected stream. 

1. In **Map To**, enter **San Leandro**.

   **Note**: You can map additional values that you know will be used, even if no streams use them yet. In **Map From** enter **PHIL**, and in **Map To**, enter **Philadelphia** , to map streams with **PHIL** to the token value **Philadelphia**. then select **Add Mapping** to confirm the mapping.

   **Note**: If a stream that matches the asset rule's stream name pattern does not have an associated mapping for a token, that stream will not be used to create an asset. This can be useful for filtering out streams that you do not want to include in the asset rule.

1. Select **{Equipment} - Pump** and select **Rename Token Values**. In this case, you must use **Rename Token Values** because you need to match a stream reference name from the asset type. 

1. Select **Generate Mappings**. This adds a row for mapping the value **Pump** that was present in the selected stream. 

1. In **Map To**, enter **Pump State**.

1. Select **{Id} - A**, and if it is not already selected, choose **Use Existing Token Values**. 

1. Select **Next**.

## Configure assets

Assign tokens values to asset fields. 

**Note**: You can enter  the `{` character to show a list of available tokens. 

1. In the **Configure Asset** panel, enter the following information.

   - Id &ndash; **{Id}**

   - Name &ndash; **{Equipment}{Id}**

   - Description &ndash; **{Region} {Site} Pump State**
 
1. Select  **Next**.

## Preview assets

Display a preview of the assets that will be created by this rule. 

1. Use the view selection at upper right to toggle between list and table view of the assets. The **Asset Preview** panel at left shows the rule details and statistics. 

1. If you are satisfied with the preview, select **Save and Execute**. In the **Asset Rule Builder** view you should see an entry for the **MyData.AssetRule** that you created.

   **Note**: If any errors occurred during execution of your asset rule, they are shown in the **Error Count** column. To see details about the errors, select the **MyData.AssetRule** rule in the list, and any specific errors are shown in the right panel under the **Errors** header.

1. Select the menu icon and select **Asset Explorer**. Ensure that the correct namespace is selected, and you should see the two assets created by the rule.
