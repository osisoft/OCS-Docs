---
uid: gsMetadataRules
---

# Get started with stream metadata rules

Metadata rules allow you to add metadata to streams. For more information about stream metadata rules and how to use them effectively, see <xref:ccMetadataRules>.

The following are the main steps for creating a metadata rule and applying it to streams. Select each step to go to the procedure for that step. 

1. [Select a stream](#step-1)

2. [Create the pattern for the stream metadata rule](#step-2)

3. [Define metadata mappings](#step-3)

4. [Apply the rule and preview the results](#step-4)

<!-- Writer's Comment: You must link the steps above to the sections below using HTML anchors because Markdown does not permit colons in anchor names. -->

## <a name="step-1"></a>Step 1: Select a stream

The first step is to identify and select a stream whose name will be the basis for creating the metadata rule.

1. In the left pane, select **Data Management** > **Stream Metadata Rules**.

1. Select **Add Metadata Rule**.

1. On the `Select Stream` page in the **Search** field, enter \**MyData*\*.

   The `MyData.NorthAmerica.SLTC.PumpA` stream is returned in the table.

1. Select **MyData.NorthAmerica.SLTC.PumpA** and select **Next**. 

## <a name="step-2"></a>Step 2: Create the pattern for the stream metadata rule

In this step, you identify delimiters in the stream name. Delimiters include periods (.), underscores (_), and hyphens (-). For each stream name part, you specify the type of data it is: metadata, string literal, or wildcard. These settings have implications for the search pattern.

1. Select the plus sign (+) above each of the three delimiters.

   **Note:** Select the minus sign (-) to ignore a delimiter.

1. In the first row, **"MyData"**, select **String Literal** from the dropdown list.

   The string *MyData* will be used to match this part of the stream pattern. However, it is not mapped to metadata.

1. In the second row, **"NorthAmerica"**, accept the default **Metadata** setting, and enter *Region* as the key.

   **Note:** Metadata keys are mapped to values in Step 3: Define metadata mappings.

1. In the third row, **"SLTC"**, accept the default **Metadata** setting, and enter *Site* as the key.

1. In the fourth row, **"PumpA"**, select **Wildcard** from the dropdown list.

   The wildcard means that streams with any values in this part of the stream name will match the pattern. However, this part of the stream name is not mapped to metadata.

   When you are done, the stream pattern you defined translates to *MyData.{Region}.{Site}.** This stream pattern returns all streams that start with the string *MyData*, followed by three parts delimited with periods. The second part corresponds to the region and the third part corresponds to the site. *Region* and *Site* are metadata.
  
1. Select **Next**. 

## <a name="step-3"></a>Step 3: Define metadata mappings

In this step, you define mappings. 

1. Select the **Region** key. This is selected by default.

   **Note:** You can change the metadata key name by editing the **Key** field.

1. Select **Copy Values** for the **Mapping Type**.

   **Copy Values** copies the string contained in that part of the stream name and assigns it to the **Region** key.

1. Select the **Site** key.

1. Select **Map Values** for the **Mapping Type**.

   This option allows you to map the part of the stream name associated with the **Site** key to another value. You can either manually enter the mappings or generate the mappings from existing streams. 
  
    **Note:** If there is a value that does not match any of the mappings, it does not create metadata for that stream. This can be useful in the instance where there are two different metadata rules that have a similar naming pattern, for example:

    - MyData.{Region}.{Site}.*

    - MyData.{Location}.{Department}.*

    The stream `MyData.WestCoast.Mfg.Inventory` matches both patterns, but the values, `WestCoast` and `Mfg`, are mapped for only one of the metadata rules, `MyData.{Location}.{Department}.\*`. Therefore, if you execute the `MyData.{Region}.{Site}.\*` rule, it will not generate metadata for the `MyData.WestCoast.Mfg.Inventory` stream.

1. To generate mappings from existing streams, select **Generate Mappings**.

   Any existing streams that match the pattern are found. For each stream that matches the pattern, that part of the stream name is listed. For the `MyData.{Region}.{Site}.*` pattern the part that corresponds to the **Site** key is listed.
   
1. In the **Map To** field, enter *San Leandro*. 

1. To create additional mappings for streams that will be created later, select **Add Mappings**.
   
1. In the **Map From** field, enter *PHL*. 

1. In the **Map To** field, enter *Philadelphia*.

   When you have defined mappings for a metadata key, a green check mark appears next to the key.

1. Select **Next**.

## <a name="step-4"></a>Step 4: Apply the rule and preview the results

In this final step, apply the metadata rule to the streams and review the results. 

1. On the `Preview and Run` page, complete the following fields:

   - **Name** - Enter *MyData.MetadataRule*.

   - **Description** - (Optional) Enter a description for the metadata rule.

   The table displays a list of streams to which this metadata rule will be applied, and the metadata keys and values that will be added to the streams. In this example, there is one stream, `MyData.NorthAmerica.SLTC.PumpA`. There are two metadata keys: the **Region** key with the value `NorthAmerica` and the **Site** key with the value `San Leandro`.

   <!-- I'd like to include a screen capture of this, but I'm not able to get to the preview page. I get an error: Failed to Load Preview There was an error loading the preview from the server This is due to a bug 216457.-->

1. Select **Save & Execute**.

   The stream metadata is created for the applicable streams. Once this is completed, examine the streams and verify that the metadata has been created. 
