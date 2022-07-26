---
uid: gpMetadataRules
---

# Create a metadata rule

Use metadata rules to identify groups of similar streams for analytical purposes. You select a stream name to use as a name pattern and assign metadata to selected stream name parts, such as a plant location or device category. The resulting stream name pattern with assigned metadata parts defines a metadata rule. Metadata rules assign defined metadata to all streams in a given namespace matching the stream name pattern defined in the rule.  

(Optional) To copy a stream name for the basis of the metadata rule:

1. In the left pane, select **Data Management** > **Sequential Data Store**.

1. On the `Sequential Data Store` page, select **Streams**.
 
1. Select the stream to use as the basis for the metadata rule and from the **Details** tab, copy its name.

To create a new metadata rule:

1. In the left pane, select **Data Management** > **Stream Metadata Rules**.

1. Select **Add Metadata Rule**.
 
1. On the `Select Stream` page in the **Search** field, enter the stream name to use as a model for the stream name pattern. You can use wild cards (*). If you copied a stream name, paste it in the field. 

   All streams that match the name pattern display.
   
1. Select the stream name to use for the metadata rule and select **Next**.

1. On the `Create Pattern` page, select the **+** sign above each selected delimiter to separate sections of the stream name.

   **Note:** Select the minus sign (-) to ignore a delimiter.

1. For each delimited section of the stream name you select, use the dropdown list to assign a metadata type. The following table describes the available metadata types. 

   | Metadata type                       | Description                                        |
   |---------------------------------|------------------------------------------------------------|
   | **Metadata**     | Assigned to the data values provided by each stream matching the name pattern of the metadata rule. At least one section must have this type. <br>**Note**: If you select metadata type **Metadata**, you must also enter a metadata key. A metadata key is the key portion of a key-value pair, typically the type of data provided, such as Measurement. This is helpful when streams that match the rule provide different types of data. Entries in the **Map To** portion of mapping represent the value part of the key-value pair. For example, *Power* would be the defined key, while different types of data could be *Demand*, *TOTAL/Electricity*, or *Metering*. The mapping entries specify the labels you want to display for each of those values.|
   | **String Literal**      | Only stream names with the specified string in the part designated will match the name pattern of this metadata rule. |
   | **Wildcard**       | Designates a part of the stream name pattern in which any value is accepted by this metadata rule. | 

1. After assigning all metadata type entries, select **Next**.
    
1. On the `Define Mappings` page, for each metadata key do one of the following:

     - To display the raw stream data for the specified metadata key, select **Copy Values** under **Mapping Type**.
     
     - To assign a label to data values:

       - Select **Map Values** and select **Generate Mappings**. 
       
       - In the **Map To** field, enter the label to display for each defined metadata key.
    
       - (Optional) Select **Add Mapping** to define a mapping for any other stream name part.
      
    When you have defined mappings for a metadata key, a green check mark appears next to the key.

1. Select **Next**. All matching streams for the rule are displayed.

1. On the `Preview and Run` page, complete the following fields:

   - **Name** - Enter a name to identify the metadata rule.

   - **Description** - Enter a description for the metadata rule.

1. Select **Save & Execute**.
