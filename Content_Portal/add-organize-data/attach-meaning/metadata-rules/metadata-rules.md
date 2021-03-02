---
uid: Metadatarules
---

# Metadata rules

Use metadata rules to identify groups of similar streams for analytical purposes. You select a stream name to use as a name pattern and assign metadata to selected stream name parts, such as a plant location or device category. The resulting stream name pattern with assigned metadata parts defines a metadata rule. Metadata rules assign defined metadata to all streams in a given namespace matching the stream name pattern defined in the rule.  

## Create a metadata rule

To create a new metadata rule, complete the following:

1. Click **Sequential Data Store** under **Data Management** in the OCS Portal. 
2. In the **Sequential Data Store** page, click **Streams** and then select in the **Namespace** droplist the namespace in which you intend to create the metadata rule.  
3. Review the streams in the namespace, and copy the stream name that will be the basis for your metadata rule.
4. Click the menu icon to display the menu, and then click **Metadata Management** under **Data Management**.
5. In the **Metadata Management** page, click **Add Metadata Rule*.
6. In the **Select Stream** pane, select in the **Namespace** droplist the same namespace in which the model stream resides.
7. Paste the copied steam name into the **Search** field. Click on the row of the selected stream name in the search results and click **Next**.
   **Note**: You can also enter the first few characters of a selected stream name followed by * (wild card).
8. In the **Create Pattern** page, click the **+** sign above the delimiter to separate selected sections of the stream name.
9. For each section of the stream name you separate, use the droplist to assign a metadata type: **Metadata**, **String Literal**, or **Wildcard**. If you select metadata type **Metadata**, you must also enter a metadata key.
   **Note**: A metadata is the key portion of a key-value pair. The value entered is typically to indicate the type of data provided, such as "Measurement."
   
   ### Metadata types

| Metadata type                       | Description                                        |
|---------------------------------|------------------------------------------------------------|
| **Metadata**     | Typically assigned to the actual data provided by each stream matching the name pattern of the metadata rule.  Requires the definition of a key-value pair. |
| **String Literal**      | Only stream names that start with the specified string will match the name pattern of this metadata rule. |
| **Wildcard**       | Designates a part of the stream name pattern in which any value will match the name pattern of this metadata rule. |

10. After entering all metadata type entries, click **Next**.
11. In the **Define Mappings** page, select **Copy Values** under **Mapping Type** to display the raw stream data for the specified metadata key, or select **Map Values** and click **Generate Mappings**.
12. If you selected **Copy Values**, omit this step.  If you selected **Map Values**, type into the **Map To...** entry field the label you wish to display for each defined metadata key for each matching stream, and click **Next**.
13. Click **Add Mapping** to define mapping for any other stream name part (optional).
14. Click **Next**. All matching streams for the rule are displayed.
15. Enter the metadata rule **Name** and **Description** in the **Preview and Run** page.
16. Click **Save & Execute**.
